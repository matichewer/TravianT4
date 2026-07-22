<?php

if(session_status() !== PHP_SESSION_ACTIVE) {
	$adminSessionLifetime = 60 * 60 * 24 * 30;
	ini_set('session.gc_maxlifetime', (string) $adminSessionLifetime);
	session_name('TRAVIANADMINSESSID');
	session_set_cookie_params($adminSessionLifetime, '/');
	session_start();
}

?>
