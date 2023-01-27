alarm[8] = targetguy_max + irandom(200);
if (!pizzahead && state != 274 && state != 273 && state != 137 && !thrown && state != 144 && state != 146)
{
	with (instance_create(irandom_range(120, room_width - 120), -77, obj_targetguy))
		image_xscale = (x > (room_width / 2)) ? -1 : 1;
}
