switch (state)
{
	case 80:
		if (attackbuffer > 0)
			attackbuffer--;
		else
			state = 0;
		break;
}
if (!place_meeting(x, y, obj_trapghost))
{
	sprite_index = spr_kingghost_spike;
	state = 0;
}
if (cooldown > 0 && state != 80)
	cooldown--;
