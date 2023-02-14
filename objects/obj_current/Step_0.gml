instance_destroy(instance_place(x, y - 1, obj_baddie));
if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != states.golf && state != 91 && state != states.gotoplayer && state != 214 && state != 213 && state != 212)
		{
			if (place_meeting(x, y + 1, other))
			{
				if (state != 210 && state != 211)
				{
					if (state != states.barrel && state != states.barreljump && state != states.barrelslide && state != states.barrelclimbwall)
					{
						if (state != states.slipnslide || sprite_index != spr_currentplayer)
							fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
						state = states.slipnslide;
						sprite_index = spr_currentplayer;
					}
					else
					{
						state = states.barrelslide;
						if (sprite_index != spr_player_barrelslipnslide)
							sprite_index = spr_player_barrelroll;
					}
					xscale = sign(other.image_xscale);
					movespeed = 20;
				}
				else
				{
					fmod_event_one_shot_3d("event:/sfx/misc/waterslidesplash", x, y);
					with (instance_create(x, y, obj_slidecloud))
					{
						image_xscale = other.xscale;
						sprite_index = spr_watereffect;
					}
					vsp = -6;
					image_index = 0;
					if (state == 210)
					{
						state = 211;
						movespeed = abs(movespeed);
						dir = xscale;
						movespeed += 3;
						instance_create(x, y, obj_jumpdust);
						sprite_index = spr_player_trashslide;
					}
				}
			}
		}
	}
}
