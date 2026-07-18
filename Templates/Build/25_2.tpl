<h1 class="titleInHeader">Residencia <span class="level"> Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid25">
<div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(25,4, 'gid');" class="build_logo">
        <img class="building big white g25" src="img/x.gif" alt="Residencia" title="Residencia" /> </a>
        La residencia es un pequeño palacio donde vive el rey o la reina cuando visita la aldea. La residencia protege la aldea de los enemigos que quieren conquistarla.
.</div>

<?php
include("upgrade.tpl");
include("25_menu.tpl"); ?>

<p>Para expandir tu nación necesitas puntos de cultura. Estos se acumulan con el tiempo gracias a tus edificios, y más rápido a niveles más altos..</p>

<table cellpadding="1" cellspacing="1" id="build_value">
<tr>
        <th>Esta aldea produce</th>
        <td><b><?php echo $database->getVillageField($village->wid, 'cp'); ?></b> puntos de cultura</td>
</tr>
<tr>
        <th>Todas las aldeas producen </th>
        <td><b><?php echo $database->getVSumField($session->uid, 'cp'); ?></b> puntos de cultura</td>
</tr>
</table><p>Para fundar una nueva aldea necesitas <b><?php $mode = CP; $total = count($database->getProfileVillages($session->uid)); echo ${'cp'.$mode}[$total+1]; ?></b> puntos de cultura. Tienes <b><?php echo $database->getUserField($session->uid, 'cp',0); ?></b> puntos de cultura. </p>
</div><div class="clear">&nbsp;</div>
    <div class="clear"></div>