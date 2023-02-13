if (instance_exists(obj_player))
{
	if (custom_level == 0)
	{
		with (obj_player)
		{
			if (place_meeting(x, y, obj_goldendoor))
				game_restart();
		}
		if (room != obj_player1.targetRoom || roomreset)
		{
			scr_room_goto(obj_player1.targetRoom);
			with (obj_player)
			{
				if (state == 7 || state == 152)
				{
					visible = true;
					state = 0;
				}
			}
		}
		if (global.coop == 1)
		{
			if (room != obj_player2.targetRoom || roomreset)
				scr_room_goto(obj_player1.targetRoom);
			with (obj_player)
			{
				if (state == 7)
					state = 0;
			}
			with (obj_player2)
			{
				if (instance_exists(obj_coopplayerfollow))
					state = states.gotoplayer;
			}
		}
	}
}
