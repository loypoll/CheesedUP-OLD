var ww = window_get_width();
var wh = window_get_height();
if ((device_mouse_x_to_gui(0) != mouse_xprevious || device_mouse_y_to_gui(0) != mouse_yprevious) && gameframe_mouse_in_window())
{
	if (window_get_cursor() == -1)
        window_set_cursor(cr_default);
	disappearbuffer = 100;
	mouse_xprevious = device_mouse_x_to_gui(0);
    mouse_yprevious = device_mouse_y_to_gui(0);
}
if (disappearbuffer > 0)
{
	captionalpha = Approach(captionalpha, 1, 0.2);
	disappearbuffer--;
}
else
{
	captionalpha = Approach(captionalpha, 0, 0.1);
	if (window_get_cursor() != -1 && window_has_focus())
        window_set_cursor(cr_none);
}
if (gameframe_get_fullscreen() > 0)
    window_set_cursor(cr_none);
if (room == Mainmenu && window_get_cursor() == -1)
    window_set_cursor(cr_default);
if (instance_exists(obj_inputAssigner) && obj_inputAssigner.player_input_device[0] >= 0)
    window_set_cursor(cr_none);
global.gameframe_alpha = captionalpha;
if window_has_focus()
{
    savedwidth = window_get_width();
    savedheight = window_get_height();
    saved_guiwidth = display_get_gui_width();
    saved_guiheight = display_get_gui_height();
}
else if global.option_fullscreen
    alarm[2] = 5;
if window_has_focus() && (window_width_current != ww || window_height_current != wh || global.option_scale_mode != last_scale_mode || global.option_fullscreen != gameframe_get_fullscreen())
{
	if (global.option_scale_mode == 0)
	{
		camera_set_view_size(view_camera[0], CAMERA_WIDTH, CAMERA_HEIGHT);
		app_scale = min(ww / CAMERA_WIDTH, wh / CAMERA_HEIGHT);
		trace(app_scale);
		
		SCREEN_WIDTH = CAMERA_WIDTH;
		SCREEN_HEIGHT = CAMERA_HEIGHT;
		
		if (app_scale > 0)
		{
			surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);
			display_set_gui_size(CAMERA_WIDTH, CAMERA_HEIGHT);
		}
	}
	else if (global.option_scale_mode == 1)
	{
		camera_set_view_size(view_camera[0], CAMERA_WIDTH, CAMERA_HEIGHT);
		app_scale = min(ww div CAMERA_WIDTH, wh div CAMERA_HEIGHT);
		
		SCREEN_WIDTH = CAMERA_WIDTH;
		SCREEN_HEIGHT = CAMERA_HEIGHT;
		
		if (app_scale > 0)
		{
			surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);
			display_set_gui_size(CAMERA_WIDTH, CAMERA_HEIGHT);
		}
	}
	else if (global.option_scale_mode == 2)
	{
		app_scale = 1;
		camera_set_view_size(view_camera[0], ww, wh);
		
		SCREEN_WIDTH = ww;
		SCREEN_HEIGHT = wh;
		
		if (ww > 0 && wh > 0)
		{
			surface_resize(application_surface, SCREEN_WIDTH, SCREEN_HEIGHT);
			display_set_gui_size(SCREEN_WIDTH, SCREEN_HEIGHT);
		}
	}
	
	last_scale_mode = global.option_scale_mode;
	last_fullscreen = gameframe_get_fullscreen();
	window_width_current = window_get_width();
	window_height_current = window_get_height();
	normal_size_fix_x = (SCREEN_WIDTH - 960) / 2;
	normal_size_fix_y = (SCREEN_HEIGHT - 540) / 2;
}
