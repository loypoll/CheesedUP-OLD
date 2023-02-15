if (state == states.normal)
{
	x = xstart;
	y = ystart;
}
else
{
	if (vsp > 0)
		vsp += 0.25;
	scr_collide();
	if (grounded && vsp > 0)
		instance_destroy();
}
