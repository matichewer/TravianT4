<?php
$heroResultRows = array();
$heroTribeNames = array(1 => TRIBE1, 2 => TRIBE2, 3 => TRIBE3);
if(isset($_POST['result']['attacker_hero'])) {
	$heroResultRows[] = array('Atacante', $_POST['result']['attacker_hero']);
}
if(isset($_POST['result']['defender_heroes']) && is_array($_POST['result']['defender_heroes'])) {
	foreach($_POST['result']['defender_heroes'] as $heroTribe => $heroResult) {
		if(isset($heroTribeNames[$heroTribe])) {
			$heroResultRows[] = array('Defensor · '.$heroTribeNames[$heroTribe], $heroResult);
		}
	}
}
?>
<?php if(!empty($heroResultRows)) { ?>
<div class="border">
	<table class="fill_in transparent" cellpadding="1" cellspacing="0">
		<tbody>
			<tr><th colspan="4">Resultado de los héroes</th></tr>
			<?php foreach($heroResultRows as $heroResultRow) {
				$heroResult = $heroResultRow[1];
			?>
			<tr>
				<td class="ico"><img src="img/x.gif" class="unit uhero" title="Héroe"></td>
				<td class="desc"><?php echo $heroResultRow[0]; ?></td>
				<td class="value">Daño: <?php echo (int)$heroResult['damage']; ?>%</td>
				<td class="research">
					<?php echo !empty($heroResult['dead'])
						? 'Cae en combate'
						: 'Sobrevive con '.(int)$heroResult['health'].'% de salud'; ?>
				</td>
			</tr>
			<?php } ?>
		</tbody>
	</table>
</div>
<?php } ?>
