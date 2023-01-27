var ww = window_get_width();
var wh = window_get_height();
if ((mouse_x != mouse_xprevious || mouse_y != mouse_yprevious) && gameframe_mouse_in_window())
{
	disappearbuffer = 100;
	mouse_xprevious = mouse_x;
	mouse_yprevious = mouse_y;
}
if (disappearbuffer > 0)
{
	captionalpha = Approach(captionalpha, 1, 0.2);
	disappearbuffer--;
}
else
	captionalpha = Approach(captionalpha, 0, 0.1);
global.gameframe_alpha = captionalpha;
if (window_width_current != ww || window_height_current != wh || global.option_scale_mode != last_scale_mode || global.option_fullscreen != gameframe_get_fullscreen())
{
	if (global.option_scale_mode == 0)
	{
		camera_set_view_size(view_camera[0], obj_screensizer.ideal_width, obj_screensizer.ideal_height);
		app_scale = min(ww / obj_screensizer.ideal_width, wh / obj_screensizer.ideal_height);
		trace(app_scale);
		obj_screensizer.actual_width = obj_screensizer.ideal_width;
		obj_screensizer.actual_height = obj_screensizer.ideal_height;
		if (app_scale > 0)
		{
			surface_resize(application_surface, obj_screensizer.ideal_width, obj_screensizer.ideal_height);
			display_set_gui_size(obj_screensizer.ideal_width, obj_screensizer.ideal_height);
		}
	}
	else if (global.option_scale_mode == 1)
	{
		camera_set_view_size(view_camera[0], obj_screensizer.ideal_width, obj_screensizer.ideal_height);
		app_scale = min(ww div obj_screensizer.ideal_width, wh div obj_screensizer.ideal_height);
		obj_screensizer.actual_width = obj_screensizer.ideal_width;
		obj_screensizer.actual_height = obj_screensizer.ideal_height;
		if (app_scale > 0)
		{
			surface_resize(application_surface, obj_screensizer.ideal_width, obj_screensizer.ideal_height);
			display_set_gui_size(obj_screensizer.ideal_width, obj_screensizer.ideal_height);
		}
	}
	else if (global.option_scale_mode == 2)
	{
		app_scale = 1;
		camera_set_view_size(view_camera[0], ww, wh);
		obj_screensizer.actual_width = ww;
		obj_screensizer.actual_height = wh;
		if (ww > 0 && wh > 0)
		{
			surface_resize(application_surface, obj_screensizer.actual_width, obj_screensizer.actual_height);
			display_set_gui_size(obj_screensizer.actual_width, obj_screensizer.actual_height);
		}
	}
	last_scale_mode = global.option_scale_mode;
	last_fullscreen = gameframe_get_fullscreen();
	window_width_current = window_get_width();
	window_height_current = window_get_height();
	normal_size_fix_x = (obj_screensizer.actual_width - 960) / 2;
	normal_size_fix_y = (obj_screensizer.actual_height - 540) / 2;
}
