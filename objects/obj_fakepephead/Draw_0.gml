shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
var pal = obj_player1.paletteselect;
pal_swap_set(spr_peppalette, pal, false);
draw_self();
if (pal == 12 && clone)
{
	pal_swap_set(spr_peppalette, 13, false);
	draw_self();
}
shader_reset();
