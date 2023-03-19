if instance_exists(obj_loadingscreen)
{
	// delay the inevitable
	alarm[0] = 1;
	exit;
}

if (instance_exists(obj_player))
{
	if (custom_level == 0)
	{
		if (room != obj_player1.targetRoom or roomreset)
		{
			if obj_player1.targetRoom == room
			{
				with obj_player1
					event_perform(ev_other, ev_room_start);
			}
			scr_room_goto(obj_player1.targetRoom);
			with (obj_player)
			{
				if (state == states.ejected or state == states.policetaxi)
				{
					visible = true;
					state = states.normal;
				}
			}
		}
		if (global.coop)
		{
			with (obj_player2)
			{
				if (instance_exists(obj_coopplayerfollow))
					state = states.gotoplayer;
			}
		}
	}
}
