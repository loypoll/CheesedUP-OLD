with (playerid)
{
	if (!isgustavo)
		state = states.normal;
	else
		state = states.ratmount;
	visible = true;
	x = roomstartx;
	y = roomstarty;
	landAnim = false;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
