function scr_panicbg_start()
{
	if live_call() return live_result;
	
	//DDP This script is run every time the first background starts to draw
	if !variable_global_exists("panicbg_surface") or !surface_exists(global.panicbg_surface)
		global.panicbg_surface = surface_create(SCREEN_WIDTH + 128, SCREEN_HEIGHT + 128)
	global.panicbg_width = 960;
	
	if event_type == ev_draw and event_number == 0
	{
		// Render all background layers to panicbg_surface instead of application_surface
		surface_set_target(global.panicbg_surface);
		draw_clear_alpha(c_black, 0);
		
		// Offset each layer to account for scrolling
		if instance_exists(obj_parrallax)
		{
			var _cam_x = camera_get_view_x(view_camera[0])
			var _cam_y = camera_get_view_y(view_camera[0])
		
			var room_bgs = room_get_bg_layers();
			for (var i = 0; i < array_length(room_bgs); i++;)
			{
				var l = room_bgs[i], lay = l.layer_id, bg = l.bg_sprite;
				if layer_get_depth(lay) <= 0
					continue;
				
				var parallax = obj_parrallax.layer_get_parallax(l.layer_id);
				if parallax == undefined
					parallax = [0, 0];
				layer_x(lay, floor(l.x + parallax[0]) - _cam_x + 64);
				layer_y(lay, floor(l.y + parallax[1]) - _cam_y + 64);
				
				global.panicbg_width = max(global.panicbg_width, sprite_get_width(bg));
			}
		}
	}
}
