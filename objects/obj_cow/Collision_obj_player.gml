with (other)
{
	if (state != states.ridecow && vsp > 0 && !place_meeting(x, yprevious, other))
	{
		if (state == states.mort or state == states.mortjump or state == states.mortattack)
			has_mort = true;
		else
			has_mort = false;
	}
}
