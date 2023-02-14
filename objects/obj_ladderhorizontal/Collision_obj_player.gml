with (other)
{
	if (key_up && ladderbuffer == 0 && (state == states.fireass || state == states.normal || state == states.pogo || state == states.mach2 || state == 121 || state == states.mach1 || state == 57 || state == states.jump || state == 60) && state != states.hurt && state != states.machslide && state != states.freefall && state != 111)
	{
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
}
