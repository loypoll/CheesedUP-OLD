switch (state)
{
	case 0:
		image_speed = 0.35;
		targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 530;
		var _g = distance_to_point(targetplayer.x, targetplayer.y);
		if (_g < 150)
			movespeed = 3;
		else if (_g < 300)
			movespeed = 4;
		else if (_g < 450)
			movespeed = 8;
		else
			movespeed = 11;
		x += movespeed;
		fmod_event_instance_set_3d_attributes(snd, x, y);
		if (place_meeting(x, y, obj_player1) || x > obj_player1.x)
		{
			var s = obj_player1.state;
			scr_hurtplayer(530);
			if (s != obj_player1.state)
			{
				state = 135;
				target_x = obj_player1.x - 700;
				movespeed = 0;
			}
		}
		break;
	case 135:
		image_speed = 0.5;
		x = Approach(x, target_x, movespeed);
		movespeed += 0.2;
		if (x == target_x)
			state = 0;
		break;
}
