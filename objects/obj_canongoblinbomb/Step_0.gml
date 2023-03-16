hsp = image_xscale * 10;
if (check_wall(x + hsp, y))
{
	instance_create(x, y, obj_canonexplosion);
	instance_destroy();
}
if (place_meeting(x + 1, y, obj_bombblock) or place_meeting(x - 1, y, obj_bombblock) or place_meeting(x, y - 1, obj_bombblock) or place_meeting(x, y + 1, obj_bombblock))
	instance_create(x, y, obj_canonexplosion);
scr_collide();
