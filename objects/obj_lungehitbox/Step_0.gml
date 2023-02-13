if (playerid.state != 43 && playerid.state != states.handstandjump)
{
	instance_destroy();
	exit;
}
x = playerid.x + (24 * playerid.xscale);
y = playerid.y;
