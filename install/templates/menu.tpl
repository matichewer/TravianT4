<?php
	if(isset($_GET['s'])) {
	switch($_GET['s']) {
		case 1:
		echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"active\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";

		break;
		case 2:
		echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"active\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";
		break;
		case 3:
		echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"active\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";
		break;
		case 4:
		echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"active\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";
		break;
        case 5:
		echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"active\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";
		break;
        case 6:
        echo "<li class=\"c2 f9\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"active\"><a href=\"#\">Fin</a></li>";
        break;
	}
    
}
else {
	echo "<li class=\"active\"><a href=\"#\">Inicio</a></li><li class=\"c1 f9\"><a href=\"#\">Configuración</a></li><li class=\"c1 f9\"><a href=\"#\">Base de datos</a></li><li class= \"c1 f9\"><a href=\"#\">Campo</a></li><li class=\"c1 f9\"><a href=\"#\">Multihunter</a></li><li class=\"c1 f9\"><a href=\"#\">Oasis</a></li><li class=\"c1 f9\"><a href=\"#\">Fin</a></li>";
}
?>