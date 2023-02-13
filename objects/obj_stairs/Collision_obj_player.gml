with (other)
{
	if (key_up && ladderbuffer == 0 && (state == 0 || state == states.pogo || state == states.mach2 || state == 121 || state == states.mach1 || state == 57 || state == states.jump || state == 60) && state != 107 && state != states.machslide && state != 108 && state != 111)
	{
		mach2 = 0;
		state = 93;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
