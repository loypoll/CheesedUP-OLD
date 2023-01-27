surface_reset_target();
shader_reset();
draw_set_alpha(1);
if (!surface_exists(gui_surf))
{
	gpu_set_blendmode(0);
	exit;
}
if (frac(app_scale) > 0)
	gpu_set_texfilter(true);
else
	gpu_set_texfilter(false);
if (global.option_scale_mode == 0)
	draw_surface(gui_surf, 0, 0);
else
{
	var _w = display_get_gui_width() * app_scale;
	var _h = display_get_gui_height() * app_scale;
	draw_surface_ext(gui_surf, window_to_gui_x((window_get_width() / 2) - (_w / 2)), window_to_gui_y((window_get_height() / 2) - (_h / 2)), window_to_gui_xscale(app_scale), window_to_gui_yscale(app_scale), 0, c_white, 1);
}
gpu_set_blendmode(0);
gpu_set_texfilter(false);
gameframe_draw();
