with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == 9 || state == 80 || state == 0 || state == states.pogo || state == states.mach2 || state == 121 || state == states.mach1 || state == 57 || state == states.jump || state == 60) && state != 107 && state != states.machslide && state != 108 && state != 111)
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = 93;
		x = other.x + 16;
		y = other.y + 40;
	}
}
