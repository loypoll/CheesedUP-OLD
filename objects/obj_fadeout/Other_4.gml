if (room == Titlescreen && obj_player.state == 18)
{
	obj_player1.sprite_index = spr_player_machfreefall;
	obj_player1.state = 84;
	obj_player1.movespeed = 6;
	obj_player1.vsp = 5;
	obj_player1.xscale = 1;
	obj_player1.player_x = 50;
	obj_player1.player_y = 50;
}
if (obj_player.state == 119)
{
	if (!global.pizzadelivery)
	{
		with (instance_create(obj_stopsign.x - (SCREEN_WIDTH / 2), obj_stopsign.y, obj_taxidud))
		{
			playerid = obj_player1;
			if (obj_player1.policetaxi)
			{
				obj_player1.policetaxi = false;
				sprite_index = spr_taxicop;
			}
		}
	}
	else
	{
		with (instance_create(obj_checkpoint.x - (SCREEN_WIDTH / 2), obj_checkpoint.y - 50, obj_taxidud))
			playerid = obj_player1;
		with (obj_player)
		{
			x = obj_checkpoint.x;
			y = obj_checkpoint.y - 50;
		}
	}
}
if (obj_player.state == 152)
{
	with (obj_player)
	{
		visible = true;
		state = 0;
	}
}
if (obj_player.state == 292)
	instance_create(obj_spaceshuttlestop.x, camera_get_view_y(view_camera[0]) - 50, obj_spaceshuttletrans);
