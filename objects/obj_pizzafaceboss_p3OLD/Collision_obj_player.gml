if (state == 156)
	exit;
if (other.state == 42)
{
	if (state == 42)
	{
		with (other)
		{
			state = 262;
			substate = 79;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 8;
			sprite_index = spr_grab;
		}
		state = 262;
		substate = 79;
		punchcount = 12;
		attackcooldown = 0;
		playerid = other.id;
	}
	else
	{
		with (other)
		{
			state = 262;
			substate = 79;
			attackcooldown = 0;
			baddieID = other.id;
			punchcount = 5;
			sprite_index = spr_grab;
		}
		hsp = 0;
		playerid = other.id;
		state = 262;
		substate = 4;
		cooldown += 15;
	}
}
else if (state == 42)
{
	state = 262;
	substate = 79;
	punchcount = 6;
	attackcooldown = 0;
	playerid = other.id;
	other.state = 262;
	other.substate = 4;
	other.sprite_index = other.spr_hurt;
}
