var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
shader_set(global.Pal_Shader);
scr_palette_texture(sprite_index, image_index, x - cx, y - cy, 1, 1, 0, c_white, 1, true);
pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect);
draw_sprite(sprite_index, image_index, x - cx, y - cy);
reset_shader_fix();
