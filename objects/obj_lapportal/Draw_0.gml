if (sprite_index != spr_pizzaportal)
{
	shader_set(global.Pal_Shader);
	scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale);
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	draw_self();
	shader_reset();
}
else
{
	draw_self();
	draw_sprite(spr_lap2warning, 0, x, y + Wave(-5, 5, 0.5, 5));
}
