<?php

require_once dirname(__DIR__) . '/config/connection.php';
if(DB_TYPE !== 1) {
	fwrite(STDERR, "Session management integration check requires the MySQLi database driver.\n");
	exit(1);
}

require_once dirname(__DIR__) . '/GameEngine/Database/db_MYSQLi.php';

$assert = function($condition, $message) {
	if(!$condition) {
		fwrite(STDERR, $message . "\n");
		exit(1);
	}
};

$query = "CREATE TEMPORARY TABLE " . TB_PREFIX . "users (
	username VARCHAR(100) NOT NULL PRIMARY KEY,
	sessid VARCHAR(2048) NOT NULL DEFAULT ''
) ENGINE=MyISAM";
if(!mysqli_query($database->connection, $query)) {
	fwrite(STDERR, mysqli_error($database->connection) . "\n");
	exit(1);
}

mysqli_query($database->connection, "INSERT INTO " . TB_PREFIX . "users (username, sessid) VALUES ('session-check', '')");

$getTokens = function() use ($database) {
	$result = mysqli_query($database->connection, "SELECT sessid FROM " . TB_PREFIX . "users WHERE username = 'session-check'");
	$row = mysqli_fetch_assoc($result);
	return $row['sessid'] === '' ? array() : explode('+', $row['sessid']);
};

$database->addActiveSession('session-check', 'device-a');
$database->addActiveSession('session-check', 'device-b');
$assert($database->checkActiveSession('session-check', 'device-a'), 'First device was invalidated by the second login.');
$assert($database->checkActiveSession('session-check', 'device-b'), 'Second device token was not registered.');

$beforeStaleCheck = $getTokens();
$assert(!$database->checkActiveSession('session-check', 'stale-device'), 'Unknown stale token was accepted.');
$assert($getTokens() === $beforeStaleCheck, 'Checking a stale token modified valid device tokens.');

$database->removeActiveSession('session-check', 'device-a');
$assert(!$database->checkActiveSession('session-check', 'device-a'), 'Logged-out device token remained valid.');
$assert($database->checkActiveSession('session-check', 'device-b'), 'Logging out one device invalidated another device.');

$beforeUnknownRemoval = $getTokens();
$database->removeActiveSession('session-check', 'unknown-device');
$assert($getTokens() === $beforeUnknownRemoval, 'Removing an unknown token changed valid device tokens.');

for($i = 1; $i <= 21; $i++) {
	$database->addActiveSession('session-check', 'bounded-' . $i);
}
$boundedTokens = $getTokens();
$assert(count($boundedTokens) === 20, 'Session token registry did not retain exactly the configured 20 newest tokens.');
$assert(!in_array('bounded-1', $boundedTokens, true), 'Oldest token was not removed from the bounded registry.');
$assert(in_array('bounded-21', $boundedTokens, true), 'Newest token is missing from the bounded registry.');

$phpConfig = parse_ini_file(dirname(__DIR__) . '/docker/php.ini');
$assert((int) $phpConfig['session.cookie_lifetime'] === 2592000, 'PHP session cookie lifetime is not 30 days.');
$assert((int) $phpConfig['session.gc_maxlifetime'] === 2592000, 'PHP server-side session lifetime is not 30 days.');

$adminSessionSource = file_get_contents(dirname(__DIR__) . '/GameEngine/Admin/admin_session.php');
$assert(strpos($adminSessionSource, "session_name('TRAVIANADMINSESSID')") !== false, 'Admin does not use an isolated session cookie name.');

$adminLoginSource = file_get_contents(dirname(__DIR__) . '/GameEngine/Admin/function.php');
$assert(strpos($adminLoginSource, 'session_regenerate_id(true)') !== false, 'Admin login does not rotate the PHP session identifier.');

$playerSessionSource = file_get_contents(dirname(__DIR__) . '/GameEngine/Session.php');
$assert(strpos($playerSessionSource, '$this->Logout(false, true)') !== false, 'A stale player session can still invoke token-revoking logout.');
$assert(strpos($playerSessionSource, 'addActiveSession($_SESSION[\'username\'], $_SESSION[\'sessid\'])') !== false, 'Player login does not append its device token.');
$assert(strpos($playerSessionSource, 'session_regenerate_id(true)') !== false, 'Player login does not rotate the PHP session identifier.');

echo "Session management: OK (multi-device, isolated logout, bounded registry, 30-day lifetime, Admin isolation, login ID rotation).\n";

?>
