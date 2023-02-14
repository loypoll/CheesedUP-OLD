mask_index = spr_player_mask;
switch (state)
{
	case 0:
		launch_buffer = 120;
		break;
	case 17:
		switch (substate)
		{
			case 0:
				var moveH = playerid.key_left + playerid.key_right;
				var moveV = playerid.key_down - playerid.key_up;
				if (moveH != 0 || moveV != 0)
				{
					moveX = moveH;
					moveY = moveV;
				}
				hsp = 0;
				vsp = 0;
				angle += 32;
				if (launch_buffer > 0)
					launch_buffer--;
				else
					substate = 92;
				break;
			case states.jump:
				var spd = 24;
				hsp = moveX * spd;
				vsp = moveY * spd;
				angle += 64;
				with (obj_destructibles)
				{
					if (place_meeting(x - other.hsp, y - other.vsp, other))
						instance_destroy();
				}
				with (obj_metalblock)
				{
					if (place_meeting(x - other.hsp, y - other.vsp, other))
						instance_destroy();
				}
				if (place_meeting(x + hsp, y + vsp, obj_solid))
				{
					instance_destroy();
					with (playerid)
					{
						state = states.ghost;
						visible = true;
					}
					state = states.normal;
				}
				break;
		}
		break;
}
scr_collide();
event_inherited();
