if (state != 145)
{
	wave_seconds--;
	if (wave_seconds < 0)
	{
		if (wave_minutes > 0)
		{
			wave_seconds = 59;
			wave_minutes--;
		}
		else
		{
			wave_seconds = 0;
			with (obj_player1)
			{
				if (state != 7)
				{
					vsp = -11;
					state = 7;
					targetRoom = lastroom;
				}
			}
		}
	}
}
if (state == 143 || state == 142)
	alarm[0] = 60;
