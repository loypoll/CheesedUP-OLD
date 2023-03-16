if live_call() return live_result;
scr_getinput(); // no really why dont they just do this

key_back = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(_dvc, gp_face2));

// go back
if key_back or key_slap2
{
	// save stuff here
	
	if instance_exists(obj_option)
		obj_option.backbuffer = 2;
	with create_transformation_tip(lang_get_value("option_controls_saved"))
	{
		depth = -700;
		alarm[1] = 100;
	}
	instance_destroy();
}
