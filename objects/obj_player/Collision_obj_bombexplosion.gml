if (scr_transformationcheck() && state != 53 && state != 54 && state != 97 && state != 99)
{
	var dir = point_direction(other.x, other.y, x, y);
	trace(dir);
	if (!grounded && dir >= 45 && dir < 135)
	{
		state = 54;
		bombup_dir = -1;
		sprite_index = spr_superspringplayer;
		image_index = 0;
	}
	if (grounded && x > (other.x - 8) && x < (other.x + 8))
	{
		state = 53;
		xscale = -1;
		movespeed = 14;
		sprite_index = spr_hurt;
	}
	if (state != 53 && state != 54)
	{
		if (dir >= 135 && dir < 270)
		{
			state = 53;
			xscale = -1;
			movespeed = 14;
			sprite_index = spr_hurt;
		}
		else if (dir >= 270 || dir < 45)
		{
			state = 53;
			sprite_index = spr_hurt;
			movespeed = 14;
			xscale = 1;
		}
	}
}
