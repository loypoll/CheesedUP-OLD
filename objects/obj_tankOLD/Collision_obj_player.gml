var baddie = id;
if (state != 141)
{
	with (other)
	{
		if (y < other.y && attacking == 0 && sprite_index != spr_player_mach2jump && ((state == 3 && vsp > 0) || state == states.jump || state == states.mach1 || state == states.grab) && vsp > 0 && other.vsp >= 0 && sprite_index != spr_stompprep)
		{
			image_index = 0;
			if (key_jump2)
			{
				instance_create(x, y + 50, obj_stompeffect);
				stompAnim = true;
				vsp = -14;
				if (state == states.jump)
					sprite_index = spr_stompprep;
			}
			else
			{
				instance_create(x, y + 50, obj_stompeffect);
				stompAnim = true;
				vsp = -9;
				if (state == states.jump)
					sprite_index = spr_stompprep;
			}
		}
		if (y >= other.y && other.thrown == 0 && other.stuntouchbuffer == 0 && other.vsp > 0 && state != states.bump && other.state != 141)
		{
			if (state != 51 && state != states.mach1 && state != 102)
				movespeed = 0;
			var _xs = sign(x - baddie.x);
			if (floor(_xs) == 0)
				_xs = xscale;
			hsp = 3 * _xs;
			state = states.bump;
			xscale = -_xs;
			sprite_index = spr_bump;
			vsp = -4;
		}
	}
}
else
{
	with (other)
	{
		if (state != 59)
		{
			state = 59;
			sprite_index = spr_squished;
			image_index = 0;
			scr_losepoints();
		}
	}
}
