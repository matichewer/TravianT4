<h1 class="titleInHeader">Oficina de comercio <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid28">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(28,4);" class="build_logo">
        <img class="building big white g28" src="img/x.gif" alt="Oficina de comercio" title="Oficina de comercio"></a>
        Los carros de comercio de tu mercado pueden mejorarse en la oficina de comercio. Cuanto mayor sea el nivel, más puede transportar cada mercader.</div>


	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Capacidad de transporte por mercader:</th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]]['attri']; ?>%</b></td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Capacidad de transporte por mercader en el nivel  <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid28[$village->resarray['f'.$id]+1]['attri']; ?>%</b></td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>
