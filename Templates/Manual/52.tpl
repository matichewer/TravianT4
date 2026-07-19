<?php
$count="0";
include("config/config.php");

		$connection = mysql_connect(SQL_SERVER, SQL_USER, SQL_PASS) or die(mysql_error());
		mysql_select_db(SQL_DB, $connection) or die(mysql_error());

		$q = "SELECT * FROM ".TB_PREFIX."movement where endtime < ".time()." and proc = 0";
		$result = mysql_query($q, $connection);
		$count=mysql_num_rows($result);

?>

<h1><img class="point" src="img/x.gif" alt="" title="" /> Atasco de eventos (00:00:0?)</h1>

<p>
Todos los eventos que ocurran más adelante son calculados por un sistema de eventos. Si el servidor está sobrecargado o la conexión entre el servidor web y la base de datos es deficiente, puede producirse un atasco de eventos.
<br />
En cuanto se reciben más eventos por segundo de los que se pueden calcular, los eventos (p. ej., "construcción finalizada" o "llegada de tropas") se colocan en una cola de espera.
<br />
El orden cronológico de los movimientos de tropas se mantiene incluso durante un atasco de eventos, por lo que las tropas que normalmente llegarían primero a un lugar seguirán llegando primero.
<br />

Como jugador, no puedes hacer nada frente a un atasco de eventos, salvo esperar. Normalmente, estos problemas se resuelven automáticamente después de unos minutos. En este momento hay <b><?php echo $count; ?></b> eventos en espera.</p>

<map id="nav" name="nav">
 <area href="manual.php?s=1" title="atrás" coords="0,0,45,18" shape="rect" alt="" />
 <area href="manual.php?s=1" title="Resumen" coords="46,0,70,18" shape="rect" alt="" />
 <area href="manual.php?s=1" title="adelante" coords="71,0,116,18" shape="rect" alt="" />
</map>
<img usemap="#nav" src="img/x.gif" class="navi" alt="" />
