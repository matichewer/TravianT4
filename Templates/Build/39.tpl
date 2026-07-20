<h1 class="titleInHeader">Gran granero <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid39">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(39,4);" class="build_logo">
        <img class="building big white g39" src="img/x.gif" alt="Gran granero" title="Gran granero"></a>
        En el granero se almacena el cereal producido por tus campos de cereal. El gran granero ofrece más espacio que el granero normal para mantener tu cereal a salvo y protegido.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
	<tr>
		<th>Capacidad:</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]]['attri']; ?></b></td>
	</tr>
    
	<tr>
<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
		<th>Capacidad en el nivel <?php echo $village->resarray['f'.$id]+1; ?> :</th>
		<td><b><?php echo $bid39[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
        <?php
            }
            ?>
	</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>