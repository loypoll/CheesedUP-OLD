instance_destroy();
with (playerid)
{
	if (!isgustavo)
		state = 0;
	else
		state = 191;
	visible = true;
}
with (obj_ghostfollow)
{
	x = xstart;
	y = ystart;
}
