if (!trapped)
{
	if (comeback == 1 && obj_player1.state != 259 && obj_player1.sprite_index != spr_lonegustavo_hurt && obj_player1.state != 197)
	{
		other.brick = true;
		if (other.state != 260 && other.state != 84 && other.state != 106 && other.state != 196)
		{
			if (!other.grounded)
				other.sprite_index = spr_player_ratmountfall;
			else
				other.sprite_index = spr_player_ratmountidle;
		}
		if (other.state == 192)
		{
			other.sprite_index = spr_player_ratmountfall;
			other.jumpAnim = false;
		}
		else if (other.state == 106)
			other.sprite_index = spr_player_ratmountbump;
		instance_create(other.x, other.y, obj_genericpoofeffect);
		instance_destroy();
	}
}
else if (other.state == 259 && baddieID == -4)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	vsp = -6;
	hsp = other.xscale * 8;
	trapped = false;
	wait = true;
	comeback = false;
	alarm[0] = 30;
}
