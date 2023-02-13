if (state != 4)
{
	with (obj_player)
	{
		if (y < other.y && attacking == 0 && state == 92 && vsp > 0)
		{
			if (vsp > 0)
			{
				other.stunned = 200;
				if (x != other.x)
					other.image_xscale = -sign(other.x - x);
				image_index = 0;
				if (key_jump2)
				{
					other.vsp = -5;
					other.hsp = -other.image_xscale * 3;
					instance_create(x, y + 50, obj_stompeffect);
					other.state = states.stun;
					stompAnim = true;
					other.image_index = 0;
					vsp = -14;
					sprite_index = spr_player_stompprep;
				}
				else
				{
					other.vsp = -5;
					other.hsp = -other.image_xscale * 3;
					instance_create(x, y + 50, obj_stompeffect);
					other.state = states.stun;
					stompAnim = true;
					other.image_index = 0;
					vsp = -9;
					sprite_index = spr_player_stompprep;
				}
			}
		}
		if (state == 103)
		{
			instance_create(x, y, obj_bumpeffect);
			other.stunned = 40;
			if (x != other.x)
				other.image_xscale = -sign(other.x - x);
			other.vsp = -5;
			other.hsp = -other.image_xscale * 3;
			hsp = -xscale * 4;
			vsp = -4;
			machpunchAnim = true;
			if (x != other.x)
				other.image_xscale = -sign(other.x - x);
			other.state = states.stun;
			image_index = 0;
			state = 91;
		}
		if ((state == 104 || state == 79) && other.grounded == 1)
		{
			instance_create(x, y, obj_bumpeffect);
			other.vsp = -10;
			other.hsp = xscale;
			other.image_index = 0;
			other.stunned = 200;
			other.state = states.stun;
			machpunchAnim = true;
			if (!grounded && state != 108)
			{
				sprite_index = spr_player_mach2jump;
				vsp = -10;
			}
		}
		if (attacking == 1 && state != 104)
		{
			if (state == 121)
				other.shot = true;
			image_index = 0;
			instance_destroy(other);
			machpunchAnim = true;
			if (!grounded && state != 108)
				vsp = -10;
		}
		if (attacking == 0 && (state != 91 && state != 107) && !(y < other.y) && grabbing == 0 && other.state != states.stun)
		{
			if (x != other.x)
			{
				other.image_xscale = -sign(other.x - x);
				xscale = -sign(x - other.x);
			}
			hsp = -xscale * 4;
			vsp = -4;
			other.image_xscale = -xscale;
			other.hsp = -other.image_xscale * 4;
			other.vsp = -4;
			if (other.state == 134 || other.state == 130)
				other.state = 126;
			image_index = 0;
			state = 106;
			if (other.state == 136)
				other.state = 126;
		}
	}
}
