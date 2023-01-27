with (other)
{
	var f = 10;
	var _sound = false;
	if (state == 104 || state == 121 || state == 211 || state == 100 || state == 42 || state == 5)
		_sound = true;
	if (hsp != 0 && grounded && vsp > 0)
	{
		if ((floor(image_index) % f) == 0)
			create_debris(x, y + 43, 4065);
		if (_sound)
		{
			if (steppybuffer > 0)
				steppybuffer--;
			else
			{
				if (state == 100)
					steppybuffer = 16;
				else
					steppybuffer = 10;
				fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y);
			}
		}
	}
}
