if (state != 55 && x == xstart && y == ystart)
{
	with (other)
	{
		other.playerid = id;
		other.state = 55;
		if (state == 4)
		{
			state = 0;
			with (playerid)
				bombgrabID = -4;
		}
	}
}
