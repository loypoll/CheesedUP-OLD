draw_set_alpha(fade);
draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
shader_set(global.Pal_Shader);
with (obj_player1)
{
	scr_palette_texture(sprite_index, image_index, x - cx, y - cy, xscale * scale_xs, yscale * scale_ys, angle, image_blend, 1);
	pal_swap_set(spr_palette, paletteselect, false);
	draw_sprite_ext(sprite_index, image_index, x - cx, y - cy, xscale, yscale, image_angle, image_blend, 1);
}
reset_shader_fix();
draw_set_alpha(fade2);
draw_set_color(c_black);
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), false);
draw_set_alpha(1);
