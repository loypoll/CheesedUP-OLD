event_inherited();
switch (state)
{
	case 92:
		if (vsp < 20)
			vsp += grav;
		y += vsp;
		if (y > ystart && vsp > 0)
		{
			y = ystart;
			state = 0;
		}
		break;
}
