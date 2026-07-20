<?php
error_reporting(e_all);
if(time() - $_SESSION['time_p'] > 5) {
  $_SESSION['time_p'] = '';
  $_SESSION['error_p'] = '';
}

if($_POST AND $_GET['action'] == 'change_capital') {
  $pass = mysql_escape_string($_POST['pass']);
  $query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'users` WHERE `id` = ' . $session->uid);
  $data = mysql_fetch_assoc($query);
  if($data['password'] == md5($pass)) {
    $query1 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $session->uid . ' AND `capital` = 1');
    $data1 = mysql_fetch_assoc($query1);
    $query2 = mysql_query('SELECT * FROM `' . TB_PREFIX . 'fdata` WHERE `vref` = ' . $data1['wref']);
    $data2 = mysql_fetch_assoc($query2);
    if($data2['vref'] != $village->wid) {
      for($i = 1; $i<=18; ++$i) {
        if($data2['f' . $i] > 10) {
          $query2 = mysql_query('UPDATE `' . TB_PREFIX . 'fdata` SET `f' . $i . '` = 10 WHERE `vref` = ' . $data2['vref']) or die(mysql_error());
        }
      }
      
      for($i=19; $i<=40; ++$i) {
        if($data2['f' . $i . 't'] == 34) {
          $query3 = mysql_query('UPDATE `' . TB_PREFIX . 'fdata` SET `f' . $i . 't` = 0, `f' . $i . '` = 0 WHERE `vref` = ' . $data2['vref']) or die(mysql_error());
        }
      }
      
      $query3 = mysql_query('UPDATE `' . TB_PREFIX . 'vdata` SET `capital` = 0 WHERE `wref` = ' . $data1['wref']);
      $query4 = mysql_query('UPDATE `' . TB_PREFIX . 'vdata` SET `capital` = 1 WHERE `wref` = ' . $village->wid);
    }
    #print '<script language="javascript">location.href="build.php?id=' . $building->getTypeField(26) . '";</script>';
  } else {
    $error = '<b><font class="error"> Hiba</font></b><br />';
    $_SESSION['error_p'] = $error;
    $_SESSION['time_p'] = time();
    print '<script language="javascript">location.href="build.php?id=' . $building->getTypeField(26) . '&confirm=yes";</script>';
  }
}
?>
<h1 class="titleInHeader">Palacio <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid26">
<div class="build_desc">
	<a href="#" onClick="return Travian.Game.iPopup(26,4, 'gid');" class="build_logo"> 
    <img class="building big white g26" src="img/x.gif" alt="Palacio" title="Palacio" /> </a>
	El rey de la nación vive en el palacio. Cuanto mayor sea el nivel, más difícil será para los enemigos conquistar la aldea. Solo con un palacio se puede nombrar capital a una aldea. No se pueden construir un palacio y una residencia en la misma aldea. Solo se permite un palacio por cuenta. </div>
<?php 
if ($building->getTypeLevel(26) > 0) {
include("upgrade.tpl");
include("26_menu.tpl"); 

$test=$database->getAvailableExpansionTraining();

if($village->resarray['f'.$id] >= 10){
	include ("26_train.tpl");	
}
else{
	echo '<div class="c">Para fundar una nueva aldea necesitas un palacio de nivel 10, 15 o 20 y 3 colonos. Para conquistar una nueva aldea necesitas un palacio de nivel 10, 15 o 20 y un senador, jefe o caudillo.</div>';
}

?>

<?php
$query = mysql_query('SELECT * FROM `' . TB_PREFIX . 'vdata` WHERE `owner` = ' . $session->uid . ' AND `capital` = 1');
$data = mysql_fetch_assoc($query);
if($data['wref'] == $village->wid) {
?>
<p class="none">Esta aldea es la capital</p>
<?php 
} else {
  if($_GET['confirm'] == '') {
    print '<p><a class="arrow" href="?id=' . $building->getTypeField(26) . '&confirm=yes">Convertir esta aldea en capital</a></p>';
  } else {
    print '<p>Introduce tu contraseña para convertir esta aldea en capital<br />
    <form method="post" action="build.php?id=' . $building->getTypeField(26) . '&action=change_capital">
     
     Jelszó: <input type="password" name="pass" />' . $_SESSION['error_p'] . '<br />
     <button type="submit" value="ok" name="s1" id="btn_ok" value="ok" class="startTraining">
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Ok</div></div>
                    </button>
    </form>
    </p>';
  }
}
} else {
	echo "<b>El palacio está siendo mejorado</b>";
}

?>
</div>
