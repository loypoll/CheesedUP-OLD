var _used = false;
with (obj_trapghost)
{
	if (state == 141 && trapid == other.id)
		_used = true;
}
if (_used)
{
	var _obj = id;
	with (other)
	{
		if (scr_transformationcheck() || state == 5)
		{
			if ((state != 106 || sprite_index != spr_player_catched) && (state != 5 || xscale != _obj.image_xscale) && state != 47 && state != 38 && state != 84 && state != states.gotoplayer)
			{
				state = 5;
				fmod_event_one_shot_3d("event:/sfx/misc/pepbotkick", x, y);
				xscale = sign(other.image_xscale);
				mask_index = spr_crouchmask;
				movespeed = 8;
				vsp = 0;
				sprite_index = spr_tumble;
				other.image_index = 0;
				other.sprite_index = spr_kingghost_pinball3;
				var _max = 45;
				y = other.y - _max;
				if (place_meeting(x, y, obj_platform))
					y--;
				if (scr_solid(x, y))
				{
					var i = 0;
					while (i <= _max)
					{
						if (scr_solid(x, y))
						{
							x += xscale;
							i++;
						}
						else
							break;
					}
				}
				if (scr_solid(x, y))
				{
					i = 0;
					while (i <= _max)
					{
						if (scr_solid(x, y))
						{
							y--;
							i++;
						}
						else
							break;
					}
				}
			}
		}
	}
}
