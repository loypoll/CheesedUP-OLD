depth = 0;
while (place_meeting(x, y, obj_solid) or place_meeting(x, y, obj_platform))
	y--;
