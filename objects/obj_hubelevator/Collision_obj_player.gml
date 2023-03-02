if state == 0
{
	with other
	{
		if key_up && grounded && state == states.normal
		{
			for(var i = 0; i < array_length(other.hub_array); i++)
			{
				if room == other.hub_array[i][1]
				{
					other.sel = i;
					break;
				}
			}
			
			sound_play(sfx_step);
			doorx = other.x + 50;
			other.state = 1;
		}
	}
}
