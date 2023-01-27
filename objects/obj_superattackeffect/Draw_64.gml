shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1, true);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
draw_sprite(sprite_index, image_index, x, y);
reset_shader_fix();
