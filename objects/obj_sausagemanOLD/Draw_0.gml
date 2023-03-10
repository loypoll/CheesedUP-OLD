if (cigar == 1)
{
	pal_swap_set(spr_sausageman_palette, 1, false);
	draw_self();
	shader_reset();
}
else
	draw_self();

if (flash)
{
	draw_set_flash();
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	draw_reset_flash();
}
else
{
	
}
