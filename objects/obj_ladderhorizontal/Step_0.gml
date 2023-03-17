hsp = dir * spd;
if (check_wall(x + hsp, y))
{
	while (!check_wall(x + sign(hsp), y))
		x += sign(hsp);
	hsp *= -1;
	dir *= -1;
}
x += hsp;
if (hooked)
{
	with (obj_player)
	{
		if (state == states.ladder && hooked)
		{
			x = other.x + 16;
			y = other.y + 40;
			vsp = 0;
		}
	}
}
if (destroy)
{
	var b = false;
	with (obj_cowstampede)
	{
		if ((image_xscale < 0 && x > (room_width * 0.3)) or (image_xscale > 0 && x < (room_width * 0.7)))
			b = true;
	}
	if (!b)
		instance_destroy();
}
