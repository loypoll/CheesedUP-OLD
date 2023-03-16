if (!other.grabbable)
	exit;
if (state != states.boxxedpepspin)
{
	if (state == states.handstandjump or state == states.lungeattack or state == states.punch)
	{
		if (other.state == states.normal && scr_transformationcheck() && !cutscene && state != states.bombgrab && (state == states.handstandjump or state == states.punch or state == states.lungeattack))
		{
			state = states.bombgrab;
			image_index = 0;
			sprite_index = spr_haulingstart;
			other.defused = true;
			bombgrabID = other.id;
			sound_play_3d("event:/sfx/noise/bombbounce", x, y);
			with (instance_create(x + (xscale * 25), y, obj_parryeffect))
			{
				sprite_index = spr_grabeffect;
				image_xscale = other.xscale;
				image_speed = 0.35;
			}
			with (other)
			{
				state = states.grabbed;
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
