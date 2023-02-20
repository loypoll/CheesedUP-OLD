if (!flash)
{
	shader_set(global.Pal_Shader);
	scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, false);
	pal_swap_set(spr_peppalette, obj_player1.paletteselect, false);
}
else
	draw_set_flash(true);
draw_self();
if (!flash)
{
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
draw_set_flash(false);
