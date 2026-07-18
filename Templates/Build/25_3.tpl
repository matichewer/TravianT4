<h1 class="titleInHeader">Residencia <span class="level"> Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="Residencia" title="Residencia" /> </a>
        In order to expand your nation you need puntos de cultura. These accumulate over time from your buildings, and faster at higher levels.</div>

<?php
include("upgrade.tpl"); include("25_menu.tpl"); ?>
In order to expand your nation you need puntos de cultura. These accumulate over time from your buildings, and faster at higher levels. La lealtad de esta aldea es  <b><?php echo $database->getVillageField($village->wid, 'loyalty'); ?></b>%. <br><br><b>Las capitales no pueden ser conquistadas </b></div>