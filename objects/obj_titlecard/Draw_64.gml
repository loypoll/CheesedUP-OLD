draw_set_alpha(1);
if (start)
{
	shader_set(global.Pal_Shader);
	if REMIX
		scr_palette_texture(titlecard_sprite, titlecard_index, 0, 0, 1, 1);
	pal_swap_set(spr_peppalette, REMIX && instance_exists(obj_player1) ? obj_player1.paletteselect : 1, false);
	draw_sprite(titlecard_sprite, titlecard_index, 0, 0);
	pal_swap_reset();
	var s = 1;
	draw_sprite(title_sprite, title_index, 32 + irandom_range(-s, s), irandom_range(-s, s));
}
if (!instance_exists(obj_fadeout))
	draw_set_alpha(fadealpha);
else
	draw_set_alpha(obj_fadeout.fadealpha);
draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
draw_set_alpha(1);
