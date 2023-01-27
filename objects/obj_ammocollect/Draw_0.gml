if (flash)
{
	shader_set(0);
	draw_self();
	shader_reset();
}
else
	draw_self();
