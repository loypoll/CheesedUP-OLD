if state == 0
{
	with other
	{
		if key_up && grounded && state == states.normal
		{
			keyboard_clear(global.key_up);
			
			sound_play(sfx_step);
			doorx = other.x + 50;
			other.state = 1;
		}
	}
}
