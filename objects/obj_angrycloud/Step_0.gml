image_speed = 0.35;
image_xscale = playerid.xscale;
x = playerid.x;
y = playerid.y;
if (global.combo < 25 || playerid.state != 0)
	instance_destroy();
