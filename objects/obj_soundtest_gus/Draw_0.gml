shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale);
pal_swap_set(706, obj_player1.paletteselect, false);
draw_self();
shader_reset();
