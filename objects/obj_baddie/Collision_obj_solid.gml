if (state != 294 && use_collision && state != states.grabbed && state != 154 && state != states.hit && state != 266 && (!place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_onewaybigblock)))
	instance_destroy();
