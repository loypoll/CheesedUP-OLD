with (other)
{
	if (state != 190 && vsp > 0 && !place_meeting(x, yprevious, other))
	{
		if (state == 11 || state == 12 || state == 13)
			has_mort = true;
		else
			has_mort = false;
	}
}
