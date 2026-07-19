<?php

    $artefact = $database->getArtefactDetails($_GET['show']);
                    if($artefact['size'] == 1){
                       $reqlvl = 10;
                       $effect = "Aldea con inscripciones";
                   }elseif($artefact['size'] == 2 OR $artefact['size'] == 3){
                       $reqlvl = 20;
                       $effect = "Todas las aldeas";
                   }  
                   if ($artefact['conquered'] >= (time()-86400)){
                   $active = "Inactive"; 
                   }else{
                    $active = "Active"; 
                   }
	
?>
        
       <div class="artefact.image-6">
        <h4 class="round"><?php echo $artefact['name'];?> <b><?php echo $artefact['effect']; ?></b></h4>
            <table id="art_details" cellpadding="1" cellspacing="1">
                <tbody>
                    <tr>
                        <td colspan="2" class="desc">
                            <span class="detail"><center>
                            <?php echo $artefact['desc']; ?></center></span>
                        </td>
                    </tr>
                    <tr>
                        <th>El artefacto</th>
                        <td>
                            <a href="spieler.php?uid=<?php echo $artefact['owner'];?>"><?php echo $database->getUserField($artefact['owner'],"username",0);?></a>
                        </td>
                    </tr>
                    <tr>
                        <th>Aldea con inscripciones</th>
                        <td>
                            <a href="karte.php?d=<?php echo $artefact['vref'];?>&c=<?php echo $generator->getMapCheck($artefact['vref']);?>"><?php echo $database->getVillageField($artefact['vref'], "name");?> </a>
                        </td>
                    </tr>                                  
                    <tr>
                        <th>Alianza</th>
                        <td><a href="allianz.php?aid=<?php echo $database->getUserField($artefact['owner'],"alliance",0);?>"><?php echo $database->getAllianceName($database->getUserField($artefact['owner'],"alliance",0)); ?></a></td>
                    </tr> 
                    <tr>
                        <th>Efecto</th>
                        <td><?php echo $effect; ?></td>
                    </tr>
        
                <tr>
                    <th>Of</th>
                    <td><b><?php echo $artefact['effect']; ?></b></td>
                </tr>
               
            <tr>
                <th>Tesorería</th>
                <td>La tesorería <b><?php echo $reqlvl; ?></b></td>
            </tr>
        
                <tr>
                    <th>Fecha</th>
                    <td><?php echo date("Y.m.d. H:i",$artefact['conquered']);?></td>
                </tr>
            
                <tr>
                    <th>Actividad</th>
                    <td><?php echo $active;?></td>
                </tr>
            </tbody></table><br />
            <h4>Artefactos</h4>
                <table class="art_details" cellpadding="1" cellspacing="1">
                    <thead>
                        <tr>
                            <td>Jugador</td>
                            <td>Aldea con inscripciones</td>
                            <td>Historial de capturas</td>
                        </tr>
                    </thead>
                    <tbody>
            
                    <tr>
                        <td><span class="none">Sin jugador</span></td>
                        <td><span class="none">[?]</span></td>
                        <td><span class="none">Aún sin conquistar</span></td> 
                        
                    </tr>
                   
                    </tr></tbody></table></div>