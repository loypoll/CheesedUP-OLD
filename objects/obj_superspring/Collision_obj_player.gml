var v = id;
with (other)
{
	if (state != 97 && state != states.gotoplayer && state != 146)
	{
		if (state == 47 || state == 48 || state == 38)
		{
			with (instance_create(x, y, obj_knightdebris))
				image_index = 0;
			with (instance_create(x, y, obj_knightdebris))
				image_index = 1;
			with (instance_create(x, y, obj_knightdebris))
				image_index = 2;
			with (instance_create(x, y, obj_knightdebris))
				image_index = 3;
			with (instance_create(x, y, obj_knightdebris))
				image_index = 4;
			with (instance_create(x, y, obj_knightdebris))
				image_index = 5;
		}
		if (state == 51)
			instance_create(x, y, obj_bombexplosion);
		x = other.x;
		if (other.image_yscale == 1)
			instance_create(x, y - 20, obj_bangeffect);
		if (other.image_yscale == 1)
		{
			sprite_index = spr_superspringplayer;
			state = 97;
			vsp = -10;
		}
		else
		{
			state = 108;
			vsp = 10;
			sprite_index = spr_player_rockethitwall;
		}
		if (other.image_yscale == -1)
		{
			if (sprite_index == spr_bottle_idle || sprite_index == spr_bottle_activate)
			{
				repeat (5)
					instance_create(other.x, other.y + 40, obj_bubbles);
				fmod_event_one_shot_3d("event:/sfx/misc/bottlepop", x, y);
			}
		}
		with (instance_create(x, y, obj_speedlinesup))
		{
			playerid = other.id;
			image_yscale = v.image_yscale;
		}
		other.image_index = 0;
		if (other.sprite_index != other.activatespr)
			fmod_event_one_shot_3d("event:/sfx/misc/superspring", x, y);
		other.sprite_index = other.activatespr;
	}
}
