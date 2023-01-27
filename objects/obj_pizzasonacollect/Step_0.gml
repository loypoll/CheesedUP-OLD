index += 0.35;
if (x != obj_player1.x)
	image_xscale = sign(obj_player1.x - x);
switch (state)
{
	case 0:
		sprite_index = idlespr;
		if (!instance_exists(collectID))
		{
			state = 74;
			sprite_index = throwspr;
			image_index = 0;
			showtext = true;
			alarm[0] = 50;
		}
		break;
	case 74:
		if (floor(image_index) == (image_number - 1))
			image_index = image_number - 1;
		if (floor(image_index) >= 3)
		{
			if (onebyoneID == -4)
			{
				global.collect -= 150;
				onebyoneID = instance_create(x, y - 30, obj_pizzasona_points);
			}
			else if (!instance_exists(onebyoneID))
			{
				state = 8;
				sprite_index = transitionspr;
				image_index = 0;
			}
		}
		break;
	case 8:
		if (floor(image_index) == (image_number - 1))
		{
			state = 92;
			sprite_index = idlespr;
			movespeed = 4;
			showtext = false;
			scr_ghostcollectible(true);
		}
		break;
	case 92:
		movespeed += 0.25;
		y -= movespeed;
		if (y < -500)
			instance_destroy();
		break;
}
