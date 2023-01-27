if (!other.grabbable)
	exit;
if (state != 34)
{
	if (state == 42 || state == 43 || state == 80)
	{
		if (other.state == 0 && scr_transformationcheck() && !cutscene && state != 52 && (state == 42 || state == 80 || state == 43))
		{
			state = 52;
			image_index = 0;
			sprite_index = spr_haulingstart;
			other.defused = true;
			bombgrabID = other.id;
			fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y);
			with (instance_create(x + (xscale * 25), y, obj_parryeffect))
			{
				sprite_index = spr_grabeffect;
				image_xscale = other.xscale;
				image_speed = 0.35;
			}
			with (other)
			{
				state = 4;
				playerid = other.id;
			}
		}
	}
}
else if (other.kickbuffer <= 0)
{
	other.vsp = -9;
	other.movespeed = 7;
	other.image_xscale = xscale;
	other.kickbuffer = 15;
	other.y--;
	other.defused = true;
}
