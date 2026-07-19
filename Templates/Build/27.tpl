<h1 class="titleInHeader">Tesorería <span class="level">Nivel <?php echo $village->resarray['f'.$id]; ?></span></h1>

    <div id="build" class="gid27">
    <div class="build_desc">
        <a href="#" onClick="return Travian.Game.iPopup(27,4);" class="build_logo">
        <img class="building big white g27" src="img/x.gif" alt="Tesorería" title="Tesorería"></a>
        Las riquezas de tu imperio se guardan en la tesorería. A partir del nivel 10, cada tesorería tiene espacio para un artefacto. Después de capturar un artefacto, tarda 24 horas en hacer efecto, excepto en servidores rápidos, donde solo tarda 12 horas </div>
        <?php
        include("upgrade.tpl");
        include("27_menu.tpl");
        if(isset($_GET['show'])){  include("27_show.tpl");  }else{
        if(!isset($_GET['t'])){
            include("27_1.tpl");     
        }elseif(isset($_GET['t']) && $_GET['t'] == 2){
            include("27_2.tpl"); 
        }elseif(isset($_GET['t']) && $_GET['t'] == 3){
            include("27_3.tpl");
        }
        }
        
        
        ?>
    </div>