function scr_player_grind()
{
	sprite_index = !skateboarding ? spr_grind : spr_clown;
	image_speed = 0.35;
	machhitAnim = false;
	crouchslideAnim = true;
	hsp = xscale * movespeed;
	if (movespeed < 10)
		movespeed = Approach(movespeed, 10, 0.5);
	if (!place_meeting(x, y + 18, obj_grindrail) && !place_meeting(x, y + 18, obj_grindrailslope))
	{
		// this code is gross and bad why did i use switches for everything what is wrong with me
		switch character
		{
			default:
				if character != "N" or noisetype == 0
				{
					if (movespeed < 12 or skateboarding)
					{
						state = states.mach2;
						sprite_index = spr_mach2jump;
					}
					else
					{
						state = states.mach3;
						sprite_index = spr_mach4;
					}
				}
				else
				{
					sprite_index = spr_playerN_pogostart;
					image_index = 0;
					state = states.pogo;
				}
				break;
		}
	}
	if (check_wall(x + xscale, y) && !place_meeting(x, y + 18, obj_grindrailslope) && !place_meeting(x, y + 1, obj_slope))
	{
		state = states.bump;
		hsp = -xscale * 5;
		vsp = 1;
	}
	if (input_buffer_jump > 0)
	{	
		switch character
		{
			default:
				if character != "N" or noisetype == 0
				{
					input_buffer_jump = 0;
					with (instance_create(x, y, obj_jumpdust))
						image_xscale = other.xscale;
					vsp = -11;
					jumpstop = false;
					if (skateboarding)
					{
						sprite_index = spr_clownjump;
						image_index = 0;
					}
					if (movespeed < 12 or skateboarding)
					{
						state = states.mach2;
						sprite_index = spr_mach2jump;
					}
					else
					{
						state = states.mach3;
						sprite_index = spr_mach3jump;
					}
				}
				else
				{
					input_buffer_jump = 0
					with (instance_create(x, y, obj_jumpdust))
						image_xscale = other.xscale;
					vsp = -11;
					jumpstop = false;
					sprite_index = spr_playerN_pogostart;
					image_index = 0;
					state = states.pogo;
				}
				break;
		}
	}
	if (!instance_exists(obj_grindeffect))
		instance_create(x, y, obj_grindeffect);
}
