with (other)
{
	if (key_up2)
	{
		if (state == states.normal)
			state = 191;
		else if (state == 191)
			state = states.normal;
	}
}
