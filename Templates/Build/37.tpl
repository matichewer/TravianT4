<h1 class="titleInHeader">Mansión del héroe <span class="level"> Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid37">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(37,4);" class="build_logo">
        <img class="building big white g37" src="img/x.gif" alt="Mansión del héroe" title="Mansión del héroe"></a>
        En la Mansión del héroe puedes obtener un resumen de los oasis cercanos. A partir del nivel 10 del edificio, puedes ocupar un oasis con tu héroe y aumentar la producción de recursos de tu aldea.</div>
        
       <?php           
            include ("upgrade.tpl");             
            include("37_heromansion.tpl");
        ?>
        
    </div>
