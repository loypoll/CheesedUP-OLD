if (cigar == 1)
{
	pal_swap_set(91, 1, false);
	draw_self();
	shader_reset();
}
else
	draw_self();
if (flash)
{
	shader_set(0);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	shader_reset();
}
else
{
}
