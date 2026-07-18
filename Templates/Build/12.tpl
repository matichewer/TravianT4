<h1 class="titleInHeader">Herrería <span class="level"> Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid13">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(12,4);" class="build_logo">
<img class="building big white g13" src="img/x.gif" alt="Herrería" title="Herrería" />
</a>
La herrería mejora las armas y armaduras de tus tropas. Al aumentar su nivel, puedes encargar la fabricación de armas y armaduras aún mejores.<?php
include("upgrade.tpl");
	if ($building->getTypeLevel(12) > 0) {
		include("12_upgrades.tpl");
	} else {
		echo "<p><b>Las mejoras estarán disponibles cuando la herrería esté construida.</b><br>\n";
	}
?>
</div>
</div>
