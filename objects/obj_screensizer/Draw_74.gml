if (!surface_exists(gui_surf))
	gui_surf = surface_create(display_get_gui_width(), display_get_gui_height());
surface_resize(gui_surf, display_get_gui_width(), display_get_gui_height());
surface_set_target(gui_surf);
draw_clear_alpha(0, 0);
reset_blendmode();
reset_shader_fix();
