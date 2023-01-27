if (playerid != -4)
{
	visible = false;
	if (playerid.state != 184 && playerid.state != 185 && playerid.state != 61)
	{
		visible = true;
		create_particle(x, y, 9);
		playerid = -4;
	}
}
else
	visible = true;
