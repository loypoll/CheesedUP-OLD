x += (image_xscale * 4);
depth = -1;
if (check_wall(x, y) || place_meeting(x, y, obj_slope))
	instance_destroy();
