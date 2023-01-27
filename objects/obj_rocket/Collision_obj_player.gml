with (other)
{
	if (other.playerid == -4 && state != 184 && state != 146 && state != 185 && state != 186)
	{
		xscale = other.image_xscale;
		state = 184;
		other.playerid = id;
		create_transformation_tip(lang_get_value("rockettip"), "rocket");
		sprite_index = spr_rocketstart;
		image_index = 0;
		if (movespeed < 8)
			movespeed = 8;
		x = other.x;
		y = other.y + 4;
	}
}
