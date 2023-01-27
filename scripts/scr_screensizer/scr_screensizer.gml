function screen_apply_size()
{
	with (obj_screensizer)
	{
		if (global.option_resolution == 0 && global.option_scale_mode == 1)
			global.option_resolution = 1;
		if (gameframe_get_fullscreen() == 0)
			gameframe_restore();
		window_set_size(get_resolution_width(global.option_resolution, aspect_ratio), get_resolution_height(global.option_resolution, aspect_ratio));
		alarm[0] = 2;
	}
}
function screen_apply_fullscreen(fullscreen)
{
	if (fullscreen == 0)
	{
		gameframe_set_fullscreen(0);
		obj_screensizer.alarm[2] = 1;
	}
	else if (fullscreen == 1)
		gameframe_set_fullscreen(1);
	else if (fullscreen == 2)
		gameframe_set_fullscreen(2);
}
function surface_safe_set_target()
{
	surface_reset_target();
	surface_set_target(argument0);
}
function set_gui_target()
{
	while (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
	surface_set_target(argument0);
}
function surface_safe_reset_target()
{
	if (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
}
function reset_gui_target()
{
	while (surface_get_target() != -1 && surface_get_target() != application_surface)
		surface_reset_target();
	with (obj_screensizer)
	{
		if (!surface_exists(gui_surf))
			exit;
		surface_set_target(gui_surf);
	}
}
function reset_blendmode()
{
	gpu_set_blendmode_ext(2, 6);
}
function reset_shader_fix()
{
	if (shader_current() != -1)
		shader_reset();
	shader_set(6);
}
function window_to_gui_x()
{
	var _win_pos = argument0 / window_get_width();
	return display_get_gui_width() * _win_pos;
}
function window_to_gui_y()
{
	var _win_pos = argument0 / window_get_height();
	return display_get_gui_height() * _win_pos;
}
function window_to_gui_xscale()
{
	return (argument0 * display_get_gui_width()) / window_get_width();
}
function window_to_gui_yscale()
{
	return (argument0 * display_get_gui_height()) / window_get_height();
}
function get_resolution_width(resolution, aspect_ratio = 0)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_width(1, aspect_ratio); // possibility of recursion...?
	return global.resolutions[aspect_ratio][resolution][0];
}
function get_resolution_height(resolution, aspect_ratio = 0)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return get_resolution_height(1, aspect_ratio); // possibility of recursion...?
	return global.resolutions[aspect_ratio][resolution][1];
}
function get_resolution(resolution, aspect_ratio = 0)
{
	if (resolution < 0 || resolution >= array_length(global.resolutions[aspect_ratio]))
		return noone;
	return global.resolutions[aspect_ratio][resolution];
}
function screen_clear(color = c_black)
{
	draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, color, color, color, color, false);
}
function get_options()
{
	ini_open("saveData.ini");
	global.option_fullscreen = ini_read_real("Option", "fullscreen", 1);
	global.option_resolution = ini_read_real("Option", "resolution", 1);
	global.option_master_volume = ini_read_real("Option", "master_volume", 1);
	global.option_music_volume = ini_read_real("Option", "music_volume", 0.85);
	global.option_sfx_volume = ini_read_real("Option", "sfx_volume", 1);
	global.option_vibration = ini_read_real("Option", "vibration", 1);
	global.option_scale_mode = ini_read_real("Option", "scale_mode", 0);
	global.option_hud = ini_read_real("Option", "hud", 1);
	global.option_lang = ini_read_string("Option", "lang", "en");
	global.option_timer = ini_read_real("Option", "timer", 0);
	global.option_timer_type = ini_read_real("Option", "timer_type", 0);
	global.option_unfocus_mute = ini_read_real("Option", "unfocus_mute", 0);
	global.lang = global.option_lang;
	ini_close();
	screen_apply_fullscreen(global.option_fullscreen);
	obj_screensizer.start_sound = false;
}
