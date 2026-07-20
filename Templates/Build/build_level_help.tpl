<?php
if (!isset($buildingHelpType, $buildingHelpLevel)) {
	return;
}

$buildingHelpItems = array();
$buildingHelpNote = '';

if ($buildingHelpType === 'rally-point') {
	$buildingHelpTitle = 'Ventajas de la Plaza de reuniones';
	$buildingHelpItems = array(
		1 => 'Permite enviar tropas para reforzar, saquear, atacar o conquistar, y consultar los movimientos de la aldea.',
		3 => 'Las catapultas pueden elegir almacenes y graneros como objetivo.',
		5 => 'Las catapultas pueden apuntar a campos y edificios de recursos. También permite reconocer qué tipos de unidades participan en un ataque entrante, aunque no sus cantidades.',
		10 => 'Las catapultas pueden elegir casi cualquier edificio militar o de infraestructura como objetivo.',
		15 => 'Cumple el requisito para construir la Plaza de torneos.',
		20 => 'Las catapultas pueden seleccionar dos objetivos en el mismo ataque.'
	);
	$buildingHelpNote = 'Los niveles intermedios aportan población y puntos de cultura, pero no aumentan la velocidad ni la fuerza de las tropas.';
} elseif ($buildingHelpType === 'embassy') {
	$buildingHelpTitle = 'Ventajas de la Embajada';
	$buildingHelpItems = array(
		1 => 'Permite aceptar invitaciones y unirse a una alianza. También cumple uno de los requisitos para construir el Palacio.',
		3 => 'Permite fundar una alianza con capacidad inicial para 9 miembros.',
		4 => 'Desde aquí, cada nivel aumenta en 3 el límite de miembros de la alianza: nivel 4 admite 12, nivel 5 admite 15 y así sucesivamente.',
		20 => 'Permite alcanzar el máximo de 60 miembros.'
	);
	$buildingHelpNote = 'El aumento de capacidad solo resulta útil para quien dirige la alianza; se toma la Embajada de mayor nivel entre sus aldeas. Para los demás miembros, los niveles adicionales aportan principalmente población y puntos de cultura.';
	if ($buildingHelpLevel >= 3 && $buildingHelpLevel < 20) {
		$buildingHelpNote = 'Esta Embajada permite un límite de '.($buildingHelpLevel * 3).' miembros; al nivel '.($buildingHelpLevel + 1).' permitiría '.(($buildingHelpLevel + 1) * 3).'. '.$buildingHelpNote;
	} elseif ($buildingHelpLevel >= 20) {
		$buildingHelpNote = 'Esta Embajada ya permite el máximo de 60 miembros. '.$buildingHelpNote;
	}
} else {
	return;
}

$buildingHelpNextLevel = null;
foreach ($buildingHelpItems as $buildingHelpRequiredLevel => $buildingHelpText) {
	if ($buildingHelpRequiredLevel > $buildingHelpLevel) {
		$buildingHelpNextLevel = $buildingHelpRequiredLevel;
		break;
	}
}
if ($buildingHelpType === 'embassy' && $buildingHelpLevel >= 4) {
	$buildingHelpNextLevel = null;
}
?>
<details class="buildingLevelHelp">
	<summary title="Mostrar las ventajas de subir este edificio de nivel">
		<span class="buildingLevelHelpIcon" aria-hidden="true">?</span>
		<span>Ventajas al subir de nivel</span>
	</summary>
	<div class="buildingLevelHelpContent">
		<div class="buildingLevelHelpHeading">
			<strong><?php echo $buildingHelpTitle; ?></strong>
			<span>Nivel actual: <?php echo (int) $buildingHelpLevel; ?></span>
		</div>
		<ul>
			<?php foreach ($buildingHelpItems as $buildingHelpRequiredLevel => $buildingHelpText) {
				$buildingHelpItemClass = $buildingHelpRequiredLevel <= $buildingHelpLevel ? 'unlocked' : '';
				if ($buildingHelpRequiredLevel === $buildingHelpNextLevel) {
					$buildingHelpItemClass = 'next';
				}
			?>
			<li<?php echo $buildingHelpItemClass !== '' ? ' class="'.$buildingHelpItemClass.'"' : ''; ?>>
				<strong>Nivel <?php echo $buildingHelpRequiredLevel; ?>:</strong>
				<?php echo $buildingHelpText; ?>
				<?php if ($buildingHelpItemClass === 'next') { ?><span class="buildingLevelHelpNext">Próximo desbloqueo</span><?php } ?>
			</li>
			<?php } ?>
		</ul>
		<p class="buildingLevelHelpNote"><?php echo $buildingHelpNote; ?></p>
	</div>
</details>
<?php
unset(
	$buildingHelpType,
	$buildingHelpLevel,
	$buildingHelpTitle,
	$buildingHelpItems,
	$buildingHelpNote,
	$buildingHelpNextLevel,
	$buildingHelpRequiredLevel,
	$buildingHelpText,
	$buildingHelpItemClass
);
?>
