<?php
if(isset($_GET['id']) && isset($_GET['q'])) {
$act2 = $database->getActivateField($_GET['id'],"act2",0);
	if($act2 == $_GET['q']){
		$show = '1';
		$name = $database->getActivateField($_GET['id'],"username",0);
		$email = $database->getActivateField($_GET['id'],"email",0);
	}
}

if(isset($show)){
?>
<div class="activation">
				¡Hola <?php echo $name; ?>!,
				<br>
				<br>
				El registro fue exitoso. En pocos minutos recibirás el correo con más información
<br><br>
Enviamos el correo a la dirección indicada: <span class="email"><b><?php echo $email; ?></b></span>
			</div>
            
            <div class="activation">
				Para activar tu cuenta, revisa tu correo y busca el código de activación
			</div>
            
            <form action="activate.php" method="post">
				<div class="code"><b>
					Código de activación:</b>
				</div>
				<div>
					<input class="text" type="text" name="id" maxlength="10" />
                    <button type="submit" value="Confirmar" name="s1" id="btn_send" class="sendActivation">
                    
                    <div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">Confirmar</div></div></button></div>
			</form>
            <hr>
            
            <div class="no_mail">
				<a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">¿No recibiste el correo?</a>
				<br>
				A veces el cliente de correo detecta el mensaje como spam. Hacé clic <a href="activate.php?id=<?php echo $_GET['id']; ?>&amp;c=<?php echo $generator->encodeStr($email,5); ?>">AQUÍ</a> para obtener ayuda.
			</div>
            
            <?php } else {
?>
			<div id="activation">
				<form action="activate.php" method="post">
						<b>Código de activación:</b><br />
					<input class="text" type="text" name="id" maxlength="10" />
                        <button type="submit" value="Send" name="s1" id="btn_send" onclick="document.snd.w.value=screen.width+':'+screen.height;">
       					 <div class="button-container">
                         <div class="button-position">
                         <div class="btl">
                         <div class="btr">
                         <div class="btc"></div></div></div>
                         <div class="bml">
                         <div class="bmr">
                         <div class="bmc"></div></div></div>
                         <div class="bbl">
                         <div class="bbr">
                         <div class="bbc"></div></div></div></div>
       					 <div class="button-contents">Confirmar</div></div>
        				</button>
                        <input type="hidden" name="ft" value="a2" />
				</form>
                </div>
			
<?php }
?>