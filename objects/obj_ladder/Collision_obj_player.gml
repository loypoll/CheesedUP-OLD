with (other)
{
	if (key_up && ladderbuffer == 0 && (state == states.normal || state == states.pogo || state == states.mach2 || state == 121 || state == states.mach1 || state == states.punch || state == 57 || state == states.jump || state == 60) && state != states.hurt && state != states.machslide && state != states.freefall && state != 111)
	{
		input_buffer_jump = 0;
		state = states.ladder;
		x = other.x + 16;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
	if (key_up && ladderbuffer == 0 && (state == states.ratmountjump || state == 198 || state == 191))
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
