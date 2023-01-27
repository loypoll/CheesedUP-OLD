shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha, false);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect);
draw_self();
shader_reset();
