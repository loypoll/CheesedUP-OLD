with (other)
{
	if (key_up && ladderbuffer == 0 && (state == 0 || state == 58 || state == 104 || state == 121 || state == 103 || state == 80 || state == 57 || state == 92 || state == 60) && state != 107 && state != 105 && state != 108 && state != 111)
	{
		input_buffer_jump = 0;
		state = 93;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
	if (key_up && ladderbuffer == 0 && (state == 192 || state == 198 || state == 191))
	{
		input_buffer_jump = 0;
		state = 261;
		if (brick == 1)
		{
			with (instance_create(x, y, obj_brickcomeback))
			{
				wait = true;
				instance_create(x, y, obj_genericpoofeffect);
			}
		}
		brick = false;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
