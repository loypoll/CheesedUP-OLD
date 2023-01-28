if (sprite_index != spr_newclothes)
{
	draw_sprite(sprite_index, image_index, x, y);
	draw_sprite(achievement_spr, achievement_index, x, y - 80);
}
else
{
	shader_set(global.Pal_Shader);
	if (texture != -4)
		scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, true, texture);
	pal_swap_set(spr_peppalette, paletteselect, false);
	draw_sprite(sprite_index, image_index, x, y);
	reset_shader_fix();
}
