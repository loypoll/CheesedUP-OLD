shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x, y, image_xscale, 1, 0, image_blend, 1, false);
pal_swap_set(spr_peppalette, obj_player1.paletteselect, false);
draw_self();
shader_reset();
