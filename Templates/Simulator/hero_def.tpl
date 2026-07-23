<tr>
	<td class="ico">
		<img src="img/x.gif" class="unit uhero" title="Héroe">
	</td>
	<td class="desc">Héroe</td>
	<td class="value">
		<input class="check" type="checkbox" name="a2_hero_<?php echo $heroDefenderTribe; ?>" value="1"
			<?php if((int)$form->getValue('a2_hero_'.$heroDefenderTribe) === 1) { echo 'checked'; } ?>
			title="Agregar al héroe defensor de esta tribu">
	</td>
	<td class="research"></td>
</tr>
<tr>
	<td class="ico">
		<img src="img/x.gif" class="unit uhero" title="Fuerza de lucha del héroe">
	</td>
	<td class="desc">Fuerza de lucha del héroe</td>
	<td class="value">
		<input class="text" type="text" name="h_def_power_<?php echo $heroDefenderTribe; ?>"
			value="<?php echo $form->getValue('h_def_power_'.$heroDefenderTribe) === '' ? 100 : $form->getValue('h_def_power_'.$heroDefenderTribe); ?>"
			maxlength="5" inputmode="numeric" title="Fuerza de lucha total del héroe, incluidos los objetos (0-99999)" placeholder="Fuerza">
	</td>
	<td class="research"></td>
</tr>
<tr>
	<td class="ico">
		<img src="img/x.gif" class="unit uhero" title="Bonificación defensiva del héroe">
	</td>
	<td class="desc">Bonificación defensiva del héroe (%)</td>
	<td class="value">
		<input class="text" type="text" name="h_def_bonus_<?php echo $heroDefenderTribe; ?>"
			value="<?php echo $form->getValue('h_def_bonus_'.$heroDefenderTribe) === '' ? 0 : $form->getValue('h_def_bonus_'.$heroDefenderTribe); ?>"
			maxlength="4" inputmode="decimal" title="Porcentaje de bonus defensivo (0-20). Admite coma o punto decimal.">
	</td>
	<td class="research"></td>
</tr>
<tr>
	<td class="ico">
		<img src="img/x.gif" class="unit uhero" title="Salud del héroe">
	</td>
	<td class="desc">Salud del héroe (%)</td>
	<td class="value">
		<input class="text" type="text" name="h_def_health_<?php echo $heroDefenderTribe; ?>"
			value="<?php echo $form->getValue('h_def_health_'.$heroDefenderTribe) === '' ? 100 : $form->getValue('h_def_health_'.$heroDefenderTribe); ?>"
			maxlength="3" inputmode="numeric" title="Salud inicial del héroe (1-100)">
	</td>
	<td class="research"></td>
</tr>
