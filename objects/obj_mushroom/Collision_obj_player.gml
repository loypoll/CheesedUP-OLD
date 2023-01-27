if (other.cutscene == 0 && sprite_index != spr_bigmushroom_bounce && other.state != 186)
{
	other.jumpstop = true;
	with (other)
	{
		grounded = false;
		if (state == 105)
			state = 92;
		if (state == 0 || state == 108)
			state = 92;
		if (state == 37)
			state = 104;
	}
	if (sprite_index != spr_bigmushroom_bounce || image_index > 5)
		fmod_event_one_shot_3d("event:/sfx/misc/mushroombounce", x, y);
	sprite_index = spr_bigmushroom_bounce;
	if (other.state == 92 || other.state == 0)
	{
		other.sprite_index = other.spr_machfreefall;
		other.image_index = 0;
	}
	image_index = 0;
	other.vsp = -14;
	other.jumpstop = true;
	if (other.isgustavo && other.state != 204)
	{
		if (other.ratmount_movespeed < 12)
		{
			other.sprite_index = spr_player_ratmountmushroombounce;
			if (!other.brick)
				other.sprite_index = spr_lonegustavo_jumpstart;
		}
		else
		{
			other.sprite_index = spr_player_ratmountdashjump;
			if (!other.brick)
				other.sprite_index = spr_lonegustavo_dashjump;
		}
		other.jumpAnim = true;
		other.state = 192;
		other.image_index = 0;
	}
}
