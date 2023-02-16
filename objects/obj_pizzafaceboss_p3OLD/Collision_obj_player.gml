if (state == states.thrown)
	exit;
if (other.state == states.handstandjump)
{
	if (state == states.handstandjump)
	{
		with (other)
		{
			state = states.supergrab;
			substate = 79;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 8;
			sprite_index = spr_grab;
		}
		state = states.supergrab;
		substate = 79;
		punchcount = 12;
		attackcooldown = 0;
		playerid = other.id;
	}
	else
	{
		with (other)
		{
			state = states.supergrab;
			substate = 79;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 5;
			sprite_index = spr_grab;
		}
		hsp = 0;
		playerid = other.id;
		state = states.supergrab;
		substate = 4;
		cooldown += 15;
	}
}
else if (state == states.handstandjump)
{
	state = states.supergrab;
	substate = 79;
	punchcount = 6;
	attackcooldown = 0;
	playerid = other.id;
	other.state = states.supergrab;
	other.substate = 4;
	other.sprite_index = other.spr_hurt;
}
