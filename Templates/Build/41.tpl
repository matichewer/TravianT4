<h1 class="titleInHeader">Abrevadero <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid41">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(41,4);" class="build_logo">
        <img class="building big white g41" src="img/x.gif" alt="Abrevadero" title="Abrevadero"></a>
        Tu caballería se beneficia de una salud mucho mejor gracias al abrevadero, lo que además aumenta la velocidad de su entrenamiento en un 1% por nivel.</div>

<?php
$buildingHelpType = 'horse-drinking-trough';
$buildingHelpLevel = $village->resarray['f'.$id];
include('build_level_help.tpl');

include("upgrade.tpl");
?>
</p></div>
