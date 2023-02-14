with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass || state == states.punch || state == states.normal || state == states.pogo || state == states.mach2 || state == 121 || state == states.mach1 || state == 57 || state == states.jump || state == 60) && state != states.hurt && state != states.machslide && state != states.freefall && state != 111)
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
}
