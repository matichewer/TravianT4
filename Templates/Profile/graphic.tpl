<?php if(GP_ENABLE) {
?>
<h1>Perfil del jugador</h1>

<?php include("menu.tpl"); ?>
<?php if(isset($_POST["custom_url"])) {
$database->updateUserField($session->uid,gpack,$_POST["custom_url"],1);
 } ?>
<?php if(isset($_GET["custom_url"])) {
?>
<link href="<?php echo $_GET["custom_url"]; ?>lang/en/gp_check.css" rel="stylesheet" type="text/css">
<div id="gpack_popup">

		<div id="gpack_error">
			<img class="logo unknown" src="img/x.gif" alt="unknown" title="unknown"><span class="error">No se pudo encontrar el paquete gráfico. Esto puede deberse a los siguientes motivos:</span><br>
<ul>
<li>La ruta debe apuntar a la carpeta que contiene el archivo '<b>travian.css</b>' y las carpetas '<b>img</b>', '<b>lang</b>' y '<b>modules</b>'.</li>
<li>Tu navegador no admite paquetes gráficos alojados en tu computadora y necesita que estén en línea, con una ruta que comience con '<b>http://</b>'.</li>
</ul>			<form action="spieler.php" method="post">
				<input type="hidden" name="s" value="4">
				<div class="btn"><input type="image" alt="OK" src="img/x.gif" value="ok" class="dynamic_img" id="btn_ok"></div>
			</form>
		</div>


		<div id="gpack_activate">
			<span class="info">Paquete gráfico encontrado.</span><br>
			<img id="preview" src="img/x.gif"><br>

			La ruta '<span class="path"><?php echo $_GET["custom_url"]; ?></span>' muestra un paquete gráfico permitido. Guarda tu elección para activar el paquete gráfico. Puedes cambiar esta configuración en cualquier momento.

			<form action="spieler.php" method="post">
				<input type="hidden" name="s" value="4">
				<input type="hidden" name="custom_url" value="<?php echo $_GET["custom_url"]; ?>">
				<div class="btn"><input type="image" alt="save" src="img/x.gif" value="save" class="dynamic_img" id="btn_save" name="gp_activate_button"></div>
			</form>
		</div>
	</div>
<?php } ?>

<form action="spieler.php" method="post" name="gp_selection">
<input type="hidden" name="s" value="4" />
<table cellpadding="1" cellspacing="1" id="gpack">
    <thead>
        <tr>
            <th>Configuración del paquete gráfico</th>
        </tr>
	</thead>

			<tbody>
	        <tr>
	        	<td class="info">
				Con un paquete gráfico puedes: <br />
1. Cambiar la apariencia de Travian. <br />
2. Acelerar la carga, porque las imágenes se cargarán desde tu propio equipo. <br />
La mayoría de los paquetes gráficos se pueden probar en línea antes de descargarlos.<br />
				<span class="alert">Atención: utiliza únicamente paquetes gráficos de confianza.</span>
	        	</td>
	        </tr>
	        <tr>
	        	<th class="empty"></th>
	        </tr>
            <tr>
	        	<td>
	        		<label>
		        		<input type="radio" class="radio" name="gp_type" value="<?php echo GP_LOCATE; ?>" checked="checked">
					Paquete gráfico estándar
                    </label>
	            </td>
	        </tr>
            <tr>
	        	<td>
	        		<label>
		        		<input type="radio" class="radio" name="gp_type" value="<?php echo GP_LOCATE_NEW; ?>">
					Paquete gráfico mejorado <span class="c5 f7">(diseño nuevo)</span>		        	</label>
	            </td>
	        </tr>
            	        <tr>
	        	<th class="empty"></th>
	        </tr>
	        <tr>
	            <td>
	            	<label>
                        <input type="radio" class="radio" name="gp_type" value="custom" />
                        Paquete gráfico creado por un jugador
                    </label>
                    <input class="text" type="text" name="custom_url" value="<?php echo $session->gpack; ?>" onclick="document.gp_selection.gp_type[1].checked = true" /><br />
<div class="example">Ejemplo: <span class="path">file:///C:/Travian/gpack/</span> o <span class="path">http://www.travian.org/user/gpack/</span></div>

                </td>

            </tr>
        </tbody>
    </table>
    <p class="btn"><input type="image" alt="OK" src="img/x.gif" name="gp_selection_button" value="ok" class="dynamic_img" id="btn_ok" /></p>
    </form>


    <table cellpadding="1" cellspacing="1" id="download">
        <thead>
            <tr>

                <th colspan="4">Más paquetes gráficos</th>
            </tr>
            <tr>
                <td>Nombre</td>
                <td>Tamaño en MB</td>
                <td>Activar</td>
                <td>Descargar</td>

            </tr>
        </thead>
        <tbody>
                <tr>
                    <td class="nam">Travian Default</td>
                                        <td class="size">4</td>
                    <td class="act"><a href="spieler.php?s=4&gp_type=custom&custom_url=gpack/travian_default/">Activar</a></td>

                    <td class="down"><a href="gpack/download/travian_default.zip" target="_blank">Descargar</a></td>
                </tr>
                    </tbody>
    </table>
    <?php
    }
    ?>
