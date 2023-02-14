with (other)
{
	if (key_up && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == states.mach3 || state == states.mach1 || state == 57 || state == states.jump || state == 60) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		mach2 = 0;
		state = states.ladder;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
