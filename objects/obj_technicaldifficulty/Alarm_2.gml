instance_destroy();
with (playerid)
{
	if (!isgustavo)
		state = states.normal;
	else
		state = 191;
	visible = true;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
