<h1 class="titleInHeader">Cervecería <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid35">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(35,4);" class="build_logo">
        <img class="building big white g35" src="img/x.gif" alt="Cervecería" title="Cervecería"></a>
       En la cervecería se elaboran sabrosas bebidas. Estas bebidas hacen a tus soldados más valientes y fuertes al atacar, pero por desgracia el poder de persuasión de los caudillos disminuye y las catapultas solo hacen impactos aleatorios. Solo puede construirse en la capital, pero afecta a todo el imperio.</div>

	<table cellpadding="1" cellspacing="1" id="build_value">
		<tr>
			<th>Bono de ataque:</th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]]['attri']; ?></b>%</td>
		</tr>
		<tr>
		<?php 
        if(!$building->isMax($village->resarray['f'.$id.'t'],$id)) {
        ?>
			<th>Bono de ataque en el nivel <?php echo $village->resarray['f'.$id]+1; ?> </th>
			<td><b><?php echo $bid35[$village->resarray['f'.$id]+1]['attri']; ?></b>%</td>
            <?php
            }
            ?>
		</tr>
	</table>
<?php 
include("upgrade.tpl");
?>
</p></div>