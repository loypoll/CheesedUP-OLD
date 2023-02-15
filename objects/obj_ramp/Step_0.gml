if (used)
	image_index = 1;
else
	image_index = 0;
var s = 16;
if (place_meeting(x, y - s, obj_player))
{
	with (obj_player)
	{
		var by = 4;
		if (state == states.mach3)
			by = 10;
		var bx = 8;
		if (state == states.mach3 || state == 201)
			bx = 18;
		if ((state == states.mach2 || state == 201 || state == 211 || state == states.tumble || state == states.mach3 || state == states.trickjump) && y <= (other.y + by) && xscale == sign(other.image_xscale) && place_meeting(x, y + s, other))
		{
			vsp = -12;
			movespeed = 14;
			if (sprite_index != spr_player_rampjump)
			{
				fmod_event_one_shot("event:/sfx/pep/rampjump");
				sprite_index = spr_player_rampjump;
				image_index = 0;
			}
			if (isgustavo)
			{
				sprite_index = spr_player_ratmountwalljump;
				state = 203;
			}
			else
				state = states.trickjump;
			if (!other.used)
			{
				ramp = true;
				other.used = true;
			}
			ramp_buffer = 16;
			trace("trickjump");
		}
	}
}
