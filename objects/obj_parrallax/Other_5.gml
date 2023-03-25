// failsafe for some extreme cases where you switch rooms in an event before it resets the surface
if variable_global_exists("panicbg_surface") && surface_get_target() == global.panicbg_surface
	surface_reset_target();
room_started = false;
