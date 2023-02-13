if (place_meeting(x, y - 1, obj_player))
{
	with (obj_player)
	{
		if (state != states.gotoplayer && place_meeting(x, y + 1, other))
		{
			if (state == 47)
				state = 38;
			else if (state != 38 && state != 99)
			{
				if (state != states.machslide && state != 5 && state != states.handstandjump && state != states.mach1 && state != states.mach2 && state != 121)
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
				else if (state == states.machslide)
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
