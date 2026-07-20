<h1 class="titleInHeader">Gran almacén <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid38">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(38,4);" class="build_logo">
        <img class="building big white g38" src="img/x.gif" alt="Gran almacén" title="Gran almacén"></a>
        En el almacén se guardan los recursos madera, arcilla y hierro. El gran almacén ofrece más espacio que el almacén normal para mantener tus recursos a salvo y protegidos.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidad:</th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]]['attri']; ?></b></td>
	</tr>
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Capacidad en el nivel <?php echo $village->resarray['f'.$id]+1; ?> </th>
		<td><b><?php echo $bid38[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
        <?php
            }
            ?>
	</tr>
	</table>
 <?php 
include("upgrade.tpl");
?>
</p></div>