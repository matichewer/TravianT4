<?php
include("Templates/Plus/pmenu.tpl");
?>

    <h2>Invita amigos y recibe oro gratis</h2>

    <p>Si consigues que nuevos jugadores abran una cuenta y funden una segunda aldea en Travian, recibirás oro. Puedes usar este oro para comprar una cuenta Plus o ventajas Plus.
    <br>
    <br>
    Para traer nuevos jugadores, puedes invitarlos por correo electrónico o hacer que hagan clic en tu enlace de referido.</p>

    <h2>¿Cómo se hace?</h2>

    <h3>1) Invita a tus amigos por correo electrónico</h3>
<?php if($session->access != BANNED){ ?>
	<form action="plus.php" method="POST">
    <p><input class="mail" name="mail" value=""></p>
	<p>Texto propio:</p>
	<p><textarea id="text" name="text"></textarea></p>
	</form>
<?php }else{ ?>
    <p><a href="banned.php">&raquo; Invitar por correo electrónico</a></p>
<?php } ?>
    <h3>2) ¡Copia tu enlace de referido personal y compártelo!</h3><span class="notice">Tu enlace de referido personal:</span>
    <br>
    <span class="link"><?php echo HOMEPAGE; ?>anmelden.php?id=ref_<?php echo $session->uid; ?></span>

    <h3>Progreso de tus amigos invitados</h3>

    <p>Apenas un jugador que hayas invitado funde su <b>2</b>ª aldea, se te acreditarán <b>50</b> de oro.</p>

    <table id="brought_in" cellpadding="1" cellspacing="1">
        <thead>
            <tr>
                <th colspan="6">Jugadores traídos</th>
            </tr>

            <tr>
                <td></td>

                <td>Mundo</td>

                <td>UID</td>

                <td>Miembro desde</td>

                <td>Habitantes</td>

                <td>Aldeas</td>
            </tr>
        </thead>
		<tbody>
		<?php
		$invite = $database->getInvitedUser($session->uid);
		if(count($invite) > 0){
		foreach($invite as $invited) {
		$varray = $database->getProfileVillages($invited['id']);
		$totalpop = 0;
		foreach($varray as $vil) {
		$totalpop += $vil['pop'];
		}
		?>
            <tr>
                <td><?php echo $invited['id']; ?></td>

                <td><?php echo date("j.m.y",$invited['regtime']); ?></td>

                <td><?php echo $totalpop; ?></td>

                <td><?php echo count($varray); ?></td>
            </tr>
		<?php
		}}else{
		?>
        <tr>
            <td class="none" colspan="6">Todavía no has traído nuevos jugadores.</td>
        </tr>
		<?php } ?>
        </table>
