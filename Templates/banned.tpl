<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       ban_msq.tpl                                                 ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
##                                                                             ##
#################################################################################
$time = time();
$ban = mysql_query("SELECT * FROM ".TB_PREFIX."banlist WHERE `uid` = '".$session->uid."' and active = 1");
$ban1 = mysql_fetch_array($ban);
?>

<p>
Hola <?php echo $ban1['name']; ?>!
Has sido baneado por infringir las reglas.
</br>
El motivo de tu baneo es <?php echo $ban1['reason']; ?>.
</br>

</br></br> Para evitar que te vuelvan a banear en el futuro, deberías leer las reglas con atención:
</br></br><center> <?php echo "<a class=\"rules\" href=\"rules.php\">» Reglas del juego</a>"; ?> </center>
</br></br></br>
Para seguir jugando, contacta al Multihunter y aclara la situación con él/ella
</br></br><center> <?php echo "<a class=\"rules\" href=\"nachrichten.php?t=1&id=4\">» Escribir mensaje</a>"; ?> </center>
</br></br>
Ten en cuenta los siguientes consejos al escribir tu mensaje:
</br></br>
● Siempre hay un motivo para un baneo. <u>Trata de pensar en las posibles razones de este baneo</u> y aclara la situación con el Multihunter.
</br>
● Los Multihunter pueden revisar enormes cantidades de información sobre las cuentas. <u>Ciñete a la verdad</u> y no busques excusas para justificar tu infracción de las reglas.
</br>
● Sé colaborativo y perspicaz, esto podría reducir el castigo.
</br>
● Si el Multihunter no responde de inmediato, probablemente no esté en línea. El problema no se resolverá más rápido enviando varios mensajes, sobre todo si ni siquiera leyó el primero.
</br>
● Si realmente has sido baneado injustamente, trata de mantener la <u>calma y la cortesía</u> mientras hablas con el Multihunter y le explicas tu punto de vista.
</p>
