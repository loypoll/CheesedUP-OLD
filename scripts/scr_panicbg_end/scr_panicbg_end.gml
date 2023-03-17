function scr_panicbg_end()
{
	if live_call() return live_result;
	
	//DDP This script is run after the last background element has been drawn
	if event_type == ev_draw && event_number == 0
	{
		// I don't even know what this does
		gpu_set_blendenable(false)
		gpu_set_colorwriteenable(false, false, false, true)
		draw_rectangle(-192, -192, SCREEN_WIDTH + 192, SCREEN_HEIGHT + 192, 0)
		gpu_set_blendenable(true)
		gpu_set_colorwriteenable(true, true, true, true)
		
		// Set panic background shader and render to application_surface
		surface_reset_target()
		
		shader_set(shd_panicbg)
		
		// Set panic intensity in shader
		var panic_id = shader_get_uniform(shd_panicbg, "panic");
		shader_set_uniform_f(panic_id, global.wave / global.maxwave);
		
		// Set current time in shader
		var time_id = shader_get_uniform(shd_panicbg, "time");
		shader_set_uniform_f(time_id, scr_current_time() / (global.panicbg_width + 40));
		
		// Set amplitude
		/*
		var mult_id = shader_get_uniform(shd_panicbg, "mult");
		shader_set_uniform_f(mult_id, 1);
		*/
		
		// Draw panicbg_surface and reset to application surface
		var x1 = camera_get_view_x(view_camera[0]) - 64;
		var y1 = camera_get_view_y(view_camera[0]) - 64;
		
		draw_surface_ext(global.panicbg_surface, x1, y1, 1, 1, 0, -1, 1)
		shader_reset()
	}
}
