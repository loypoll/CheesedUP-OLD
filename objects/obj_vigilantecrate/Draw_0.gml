if (state == states.normal)
{
	if (alertvisible)
		draw_sprite(spr_vigilantecrate_alert, 0, x, 40);
}
else
	draw_self();
