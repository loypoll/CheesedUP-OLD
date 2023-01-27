if (visible == 1 && obj_player.state != 7)
{
	if (place_meeting(x, y - 1, obj_player1))
	{
		with (obj_player1)
		{
			if (state == 47)
				state = 38;
			else if (state != 38)
			{
				state = 94;
				sprite_index = spr_slipnslide;
			}
			if (movespeed < 12)
				movespeed = 12;
		}
	}
	if (place_meeting(x, y - 1, obj_player2))
	{
		with (obj_player2)
		{
			if (state == 47)
				state = 38;
			else if (state != 38)
			{
				state = 94;
				sprite_index = spr_slipnslide;
			}
			if (movespeed < 12)
				movespeed = 12;
		}
	}
}
if (visible == 0 && global.boxhp <= 5)
{
	x = xstart;
	y = ystart;
	visible = true;
	repeat (4)
		instance_create(x, y, obj_debris);
	mask_index = sprite_index;
}
