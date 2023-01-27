if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != 186 && place_meeting(x, y + 1, other))
		{
			if (state == 47)
				state = 38;
			else if (state != 38 && state != 99)
			{
				if (state != 105 && state != 5 && state != 42 && state != 103 && state != 104 && state != 121)
				{
					if (icedir != -xscale && move != 0)
					{
						if (prevmovespeed != 0)
							icemovespeed = prevmovespeed;
						else
							icemovespeed = 8;
						icedir = -xscale;
						savedicedir = -xscale;
					}
					if (prevmove != move && move == 0)
					{
						icemovespeed = -(prevmovespeed - previcemovespeed);
						icedir = -xscale;
					}
				}
				else if (state == 105)
				{
					if (prevstate != state)
					{
						icedir = xscale;
						icemovespeed = floor(abs(movespeed) * 0.5);
					}
				}
				else if (state == 5)
					icemovespeed = 0;
			}
		}
	}
}
