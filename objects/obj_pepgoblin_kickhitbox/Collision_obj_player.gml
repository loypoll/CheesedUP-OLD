with (other)
{
	if (character == "V")
		scr_hurtplayer(object_index);
	else if (scr_transformationcheck())
	{
		if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != 5 && state != 47 && state != 38 && state != 147)
		{
			scr_losepoints();
			state = 5;
			xscale = other.baddieID.image_xscale;
			movespeed = 10;
			vsp = 0;
			sprite_index = spr_tumble;
			if (other.baddieID.object_index == obj_pepbat)
				other.baddieID.hit = true;
			with (other.baddieID)
			{
				kickbuffer = 100;
				invtime = 50;
				if (object_index == obj_pepgoblin)
					invincible = true;
			}
		}
	}
}
