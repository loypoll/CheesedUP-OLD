function scr_player_gotoplayer()
{
	pogochargeactive = false;
	movespeed = 0;
	visible = false;
	if (!instance_exists(obj_coopplayerfollow))
	{
		playerid = (object_index == obj_player2) ? 530 : 529;
		var _dir = point_direction(x, y, playerid.x, playerid.y);
		hsp = lengthdir_x(16, _dir);
		vsp = lengthdir_y(16, _dir);
		var t = 16;
		repeat (8)
			create_particle(x + irandom_range(-t, t), y + irandom_range(-t, t), 1, 0);
		if (distance_to_object(playerid) < 16)
		{
			create_particle(x, y, 9, 0);
			instance_create_unique(playerid.x, playerid.y, 348);
		}
	}
	else
	{
		x = playerid.x;
		y = playerid.y;
		if (key_jump2)
		{
			xscale = playerid.xscale;
			state = 0;
			input_buffer_jump = 0;
			hurted = true;
			alarm[5] = 2;
			alarm[7] = 60;
			create_particle(x, y, 9, 0);
			visible = true;
			instance_destroy(obj_coopplayerfollow);
		}
	}
}
