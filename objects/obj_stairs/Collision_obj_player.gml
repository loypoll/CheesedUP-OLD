with (other)
{
	if (key_up && ladderbuffer == 0 && (state == 0 || state == 58 || state == 104 || state == 121 || state == 103 || state == 57 || state == 92 || state == 60) && state != 107 && state != 105 && state != 108 && state != 111)
	{
		mach2 = 0;
		state = 93;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
