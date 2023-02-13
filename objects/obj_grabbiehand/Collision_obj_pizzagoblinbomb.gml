if (state != 55 && x == xstart && y == ystart)
{
	with (other)
	{
		other.playerid = id;
		other.state = states.grabbing;
		if (state == states.grabbed)
		{
			state = 0;
			with (playerid)
				bombgrabID = -4;
		}
	}
}
