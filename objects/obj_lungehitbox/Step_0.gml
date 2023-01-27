if (playerid.state != 43 && playerid.state != 42)
{
	instance_destroy();
	exit;
}
x = playerid.x + (24 * playerid.xscale);
y = playerid.y;
