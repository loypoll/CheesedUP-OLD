image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if ((playerid.image_index > 3 || playerid.state != 23) && playerid.state != states.handstandjump && playerid.state != 19)
	instance_destroy();
