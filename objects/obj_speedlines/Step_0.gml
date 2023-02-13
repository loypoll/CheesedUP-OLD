x = playerid.x;
y = playerid.y;
image_xscale = playerid.xscale;
if (abs(playerid.hsp) <= 0 || playerid.state != 121 || playerid.state == 165 || abs(playerid.movespeed) <= 12 || (playerid.collision_flags & 1) > 0 || playerid.cutscene || playerid.state == states.comingoutdoor || playerid.state == states.door || room == timesuproom)
	instance_destroy();
if (room == timesuproom)
	instance_destroy();
