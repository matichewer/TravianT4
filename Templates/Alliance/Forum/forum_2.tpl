<?php
//////////////// made by TTMTT ////////////////
if($session->access!=BANNED){
$displayarray = $database->getUserArray($session->uid,1);
$forumcat = $database->ForumCat(htmlspecialchars($displayarray['alliance']));
$forum_cat = $database->ForumCat;
$ally = $session->alliance;
$public = mysql_query("SELECT * FROM ".TB_PREFIX."forum_cat WHERE alliance = $ally AND forum_area = 1");
$public1 = mysql_num_rows($public);
$cofederation = mysql_query("SELECT * FROM ".TB_PREFIX."forum_cat WHERE alliance = $ally AND forum_area = 2");
$cofederation1 = mysql_num_rows($cofederation);
$alliance = mysql_query("SELECT * FROM ".TB_PREFIX."forum_cat WHERE alliance = $ally AND forum_area = 0");
$alliance1 = mysql_num_rows($alliance);
$closed = mysql_query("SELECT * FROM ".TB_PREFIX."forum_cat WHERE alliance = $ally AND forum_area = 3");
$closed1 = mysql_num_rows($closed);
if($public1 != 0){
?>
<table cellpadding="1" cellspacing="1" id="public"><thead>
		<tr>
	        <th colspan="4">Foro público</th>
		</tr>

		<tr>
			<td></td>
			<td>Nombre del foro</td>
			<td>&nbsp;Temas&nbsp;</td>
			<td>&nbsp;Última publicación&nbsp;</td>
		</tr></thead><tbody>
<?php
foreach($forumcat as $arr) {
if($arr['forum_area']==1){
	$countop = $database->CountCat($arr['id']);
	$ltopic = $database->LastTopic($arr['id']);
	foreach($ltopic as $las) {
	}
	$lpos = $database->LastPost($las['id']);
	foreach($lpos as $pos) {
	}
	if($database->CheckLastTopic($arr['id'])){
		if($database->CheckLastPost($las['id'])){
			$lpost = date('m/d/y H:i a',$pos['date']);
			$owner = $database->getUserArray($pos['owner'],1);
		}else{
			$lpost = date('m/d/y H:i a',$las[date]);
			$owner = $database->getUserArray($las['owner'],1);
		}
	}else{
		$lpost = "";
		$owner = "";
	}
echo	'<tr><td class="ico">';
if($database->CheckEditRes($aid)=="1"){
	echo '<a class="up_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=-1" title="Ir arriba"><img src="img/x.gif" alt="Ir arriba" /></a><a class="edit" href="allianz.php?s=2&idf='.$arr['id'].'&admin=editforum" title="editar"><img src="img/x.gif" alt="editar" /></a><br /><a class="down_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=1" title="Ir abajo"><img src="img/x.gif" alt="Ir abajo" /></a><a class="fdel" href="allianz.php?s=2&idf='.$arr['id'].'&admin=delforum" onClick="return confirm(\'¿confirmar eliminación?\');" title="eliminar"><img src="img/x.gif" alt="eliminar" /></a>';
}else{
	echo '<img class="folder" src="img/x.gif" title="Tema sin publicaciones nuevas" alt="Tema sin publicaciones nuevas">';
}		
echo '</td><td class="tit"><a href="allianz.php?s=2&fid='.$arr['id'].'&pid='.$aid.'" title="'.stripslashes($arr['forum_name']).'">'.stripslashes($arr['forum_name']).'</a><br />'.stripslashes($arr['forum_des']).'</td>
			<td class="cou">'.$countop.'</td>
			<td class="last">'.$lpost.'</span><span><br /><a href="spieler.php?uid='.$owner['id'].'">'.$owner['username'].'</a> <img class="latest_reply" src="img/x.gif" alt="Ver última publicación" title="Ver última publicación" /></td>
		</tr>';
		
}
}
?>
		</tbody></table>
<?php
}if($cofederation1 != 0){
?>
<table cellpadding="1" cellspacing="1" id="confederation"><thead>
		<tr>
	        <th colspan="4">Foro de confederación</th>
		</tr>

		<tr>
			<td></td>
			<td>Nombre del foro</td>
			<td>&nbsp;Temas&nbsp;</td>
			<td>&nbsp;Última publicación&nbsp;</td>
		</tr></thead><tbody>
<?php
foreach($forumcat as $arr) {
if($arr['forum_area']==2){
	$countop = $database->CountCat($arr['id']);
	$ltopic = $database->LastTopic($arr['id']);
	foreach($ltopic as $las) {
	}
	$lpos = $database->LastPost($las['id']);
	foreach($lpos as $pos) {
	}
	if($database->CheckLastTopic($arr['id'])){
		if($database->CheckLastPost($las['id'])){
			$lpost = date('m/d/y H:i a',$pos['date']);
			$owner = $database->getUserArray($pos['owner'],1);
		}else{
			$lpost = date('m/d/y H:i a',$las[date]);
			$owner = $database->getUserArray($las['owner'],1);
		}
	}else{
		$lpost = "";
		$owner = "";
	}
echo	'<tr><td class="ico">';
if($database->CheckEditRes($aid)=="1"){
	echo '<a class="up_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=-1" title="Ir arriba"><img src="img/x.gif" alt="Ir arriba" /></a><a class="edit" href="allianz.php?s=2&idf='.$arr['id'].'&admin=editforum" title="editar"><img src="img/x.gif" alt="editar" /></a><br /><a class="down_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=1" title="Ir abajo"><img src="img/x.gif" alt="Ir abajo" /></a><a class="fdel" href="allianz.php?s=2&idf='.$arr['id'].'&admin=delforum" onClick="return confirm(\'¿confirmar eliminación?\');" title="eliminar"><img src="img/x.gif" alt="eliminar" /></a>';
}else{
	echo '<img class="folder" src="img/x.gif" title="Tema sin publicaciones nuevas" alt="Tema sin publicaciones nuevas">';
}		
echo '</td><td class="tit"><a href="allianz.php?s=2&fid='.$arr['id'].'&pid='.$aid.'" title="'.stripslashes($arr['forum_name']).'">'.stripslashes($arr['forum_name']).'</a><br />'.stripslashes($arr['forum_des']).'</td>
			<td class="cou">'.$countop.'</td>
			<td class="last">'.$lpost.'</span><span><br /><a href="spieler.php?uid='.$owner['id'].'">'.$owner['username'].'</a> <img class="latest_reply" src="img/x.gif" alt="Ver última publicación" title="Ver última publicación" /></td>
		</tr>';
		
}
}
?>
		</tbody></table>
<?php
}if($alliance1 != 0){
?>
<table cellpadding="1" cellspacing="1" id="alliance"><thead>
		<tr>
	        <th colspan="4">Foro de la alianza</th>
		</tr>

		<tr>
			<td></td>
			<td>Nombre del foro</td>
			<td>&nbsp;Temas&nbsp;</td>
			<td>&nbsp;Última publicación&nbsp;</td>
		</tr></thead><tbody>
<?php
foreach($forumcat as $arr) {
if($arr['forum_area']==0){
	$countop = $database->CountCat($arr['id']);
	$ltopic = $database->LastTopic($arr['id']);
	foreach($ltopic as $las) {
	}
	$lpos = $database->LastPost($las['id']);
	foreach($lpos as $pos) {
	}
	if($database->CheckLastTopic($arr['id'])){
		if($database->CheckLastPost($las['id'])){
			$lpost = date('m/d/y H:i a',$pos['date']);
			$owner = $database->getUserArray($pos['owner'],1);
		}else{
			$lpost = date('m/d/y H:i a',$las[date]);
			$owner = $database->getUserArray($las['owner'],1);
		}
	}else{
		$lpost = "";
		$owner = array();
	}
echo	'<tr><td class="ico">';
if($database->CheckEditRes($aid)=="1"){
	echo '<a class="up_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=-1" title="Ir arriba"><img src="img/x.gif" alt="Ir arriba" /></a><a class="edit" href="allianz.php?s=2&idf='.$arr['id'].'&admin=editforum" title="editar"><img src="img/x.gif" alt="editar" /></a><br /><a class="down_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=1" title="Ir abajo"><img src="img/x.gif" alt="Ir abajo" /></a><a class="fdel" href="allianz.php?s=2&idf='.$arr['id'].'&admin=delforum" onClick="return confirm(\'¿confirmar eliminación?\');" title="eliminar"><img src="img/x.gif" alt="eliminar" /></a>';
}else{
	echo '<img class="folder" src="img/x.gif" title="Tema sin publicaciones nuevas" alt="Tema sin publicaciones nuevas">';
}		
echo '</td><td class="tit"><a href="allianz.php?s=2&fid='.$arr['id'].'&pid='.$aid.'" title="'.stripslashes($arr['forum_name']).'">'.stripslashes($arr['forum_name']).'</a><br />'.stripslashes($arr['forum_des']).'</td>
			<td class="cou">'.$countop.'</td>
			<td class="last">'.$lpost.'</span><span><br /><a href="spieler.php?uid='.$owner['id'].'">'.$owner['username'].'</a> <img class="latest_reply" src="img/x.gif" alt="Ver última publicación" title="Ver última publicación" /></td>
		</tr>';
		
}
}
?>
		</tbody></table>
<?php
}if($closed1 != 0){
?>
<table cellpadding="1" cellspacing="1" id="closed"><thead>
		<tr>
	        <th colspan="4">Foro cerrado</th>
		</tr>

		<tr>
			<td></td>
			<td>Nombre del foro</td>
			<td>&nbsp;Temas&nbsp;</td>
			<td>&nbsp;Última publicación&nbsp;</td>
		</tr></thead><tbody>
<?php
foreach($forumcat as $arr) {
if($arr['forum_area']==3){
	$countop = $database->CountCat($arr['id']);
	$ltopic = $database->LastTopic($arr['id']);
	foreach($ltopic as $las) {
	}
	$lpos = $database->LastPost($las['id']);
	foreach($lpos as $pos) {
	}
	if($database->CheckLastTopic($arr['id'])){
		if($database->CheckLastPost($las['id'])){
			$lpost = date('m/d/y H:i a',$pos['date']);
			$owner = $database->getUserArray($pos['owner'],1);
		}else{
			$lpost = date('m/d/y H:i a',$las[date]);
			$owner = $database->getUserArray($las['owner'],1);
		}
	}else{
		$lpost = "";
		$owner = "";
	}
echo	'<tr><td class="ico">';
if($database->CheckEditRes($aid)=="1"){
	echo '<a class="up_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=-1" title="Ir arriba"><img src="img/x.gif" alt="Ir arriba" /></a><a class="edit" href="allianz.php?s=2&idf='.$arr['id'].'&admin=editforum" title="editar"><img src="img/x.gif" alt="editar" /></a><br /><a class="down_arr" href="allianz.php?s=2&fid='.$arr['id'].'&bid=0&admin=pos&res=1" title="Ir abajo"><img src="img/x.gif" alt="Ir abajo" /></a><a class="fdel" href="allianz.php?s=2&idf='.$arr['id'].'&admin=delforum" onClick="return confirm(\'¿confirmar eliminación?\');" title="eliminar"><img src="img/x.gif" alt="eliminar" /></a>';
}else{
	echo '<img class="folder" src="img/x.gif" title="Tema sin publicaciones nuevas" alt="Tema sin publicaciones nuevas">';
}		
echo '</td><td class="tit"><a href="allianz.php?s=2&fid='.$arr['id'].'&pid='.$aid.'" title="'.stripslashes($arr['forum_name']).'">'.stripslashes($arr['forum_name']).'</a><br />'.stripslashes($arr['forum_des']).'</td>
			<td class="cou">'.$countop.'</td>
			<td class="last">'.$lpost.'</span><span><br /><a href="spieler.php?uid='.$owner['id'].'">'.$owner['username'].'</a> <img class="latest_reply" src="img/x.gif" alt="Ver última publicación" title="Ver última publicación" /></td>
		</tr>';
		
}
}
?>
		</tbody></table>
		<?php
		}
		?>
		<p>
		<?php
			$opt = $database->getAlliPermissions($session->uid, $aid);
			if($opt['opt5'] == 1){
				echo "<button type=\"button\" value=\"???? ????\" class=\"build\" onclick=\"window.location.href = 'allianz.php?s=2&admin=newforum'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Nuevo foro</div></div></button>

<button type=\"button\" value=\"???????\" class=\"build\" onclick=\"window.location.href = 'allianz.php?s=".$ids."&admin=switch_admin'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">Opciones</div></div></button>";
			}
		?>
</p>
<?php }else{
header("Location: banned.php");
}
?>
