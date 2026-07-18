<h1 class="titleInHeader">Plaza de torneos <span class="level"> Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid14">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(14,4);" class="build_logo">
<img class="building big white g14" src="img/x.gif" alt="Plaza de torneos" title="Plaza de torneos" />
</a>
En la plaza de torneos tus tropas pueden mejorar su resistencia. Cuanto mayor sea el nivel, más rápido se moverán tus tropas a más de 20 casillas de distancia.
</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bono:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]]['attri']; ?></b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Bono en el nivel <?php echo $village->resarray['f'.$id]+1; ?>:</th>
			<td><b><?php echo $bid14[$village->resarray['f'.$id]+1]['attri']; ?></b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>