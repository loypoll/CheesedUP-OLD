if (parryable && other.state == 84 && other.parry_inst != -4)
	exit;
player_hurt(dmg, other.id);
