<h1 class="titleInHeader">Cabaña del picapedrero <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid34">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(34,4);" class="build_logo">
        <img class="building big white g34" src="img/x.gif" alt="Cabaña del picapedrero" title="Cabaña del picapedrero"></a>
       El picapedrero es un experto en trabajar la piedra. Cuanto más alto sea su nivel, más resistentes serán los edificios de tu aldea</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>
Stability of buildings at current levels:</th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]]['attri']; ?>%</b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Resistencia de los edificios en el nivel <?php echo $village->resarray['f'.$id]+1; ?></th>
			<td><b><?php echo $bid34[$village->resarray['f'.$id]+1]['attri']; ?>%</b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>