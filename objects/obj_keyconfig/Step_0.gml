depth = -400;
key_back = keyboard_check_pressed(global.key_slap) || keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face2);
key_up2 = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
key_down2 = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
key_left2 = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
key_right2 = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
key_jump = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
key_jump2 = keyboard_check(ord("Z")) || keyboard_check(vk_enter) || keyboard_check(vk_space);
if (startbuffer > 0)
{
	startbuffer--;
	key_back = false;
	key_jump = false;
	key_jump2 = false;
}
if (!selecting)
{
	if (key_up2)
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select--;
	}
	if (key_down2)
	{
		fmod_event_one_shot("event:/sfx/ui/step");
		key_select++;
	}
	if (key_select != -1 && key_left2)
		key_select = -1;
	else if (key_select == -1 && key_right2)
		key_select = 0;
	key_select = clamp(key_select, -1, array_length(input) - 1);
	if (((key_jump || key_back) && key_select <= -1) || (key_select > -1 && key_back))
	{
		var _found = false;
		for (var i = 0; i < array_length(input); i++)
		{
			if (variable_global_get(input[i][0]) == -4)
				_found = true;
		}
		if (!_found)
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			ini_open_from_string(obj_savesystem.ini_str_options);
			ini_write_string("ControlsKeys", "up", global.key_up);
			ini_write_string("ControlsKeys", "right", global.key_right);
			ini_write_string("ControlsKeys", "left", global.key_left);
			ini_write_string("ControlsKeys", "down", global.key_down);
			ini_write_string("ControlsKeys", "jump", global.key_jump);
			ini_write_string("ControlsKeys", "slap", global.key_slap);
			ini_write_string("ControlsKeys", "attack", global.key_attack);
			ini_write_string("ControlsKeys", "shoot", global.key_shoot);
			ini_write_string("ControlsKeys", "taunt", global.key_taunt);
			ini_write_string("ControlsKeys", "start", global.key_start);
			ini_write_string("ControlsKeys2", "up", global.key_upN);
			ini_write_string("ControlsKeys2", "right", global.key_rightN);
			ini_write_string("ControlsKeys2", "left", global.key_leftN);
			ini_write_string("ControlsKeys2", "down", global.key_downN);
			ini_write_string("ControlsKeys2", "jump", global.key_jumpN);
			ini_write_string("ControlsKeys2", "slap", global.key_slapN);
			ini_write_string("ControlsKeys2", "attack", global.key_attackN);
			ini_write_string("ControlsKeys2", "shoot", global.key_shootN);
			ini_write_string("ControlsKeys2", "taunt", global.key_tauntN);
			ini_write_string("ControlsKeys2", "start", global.key_startN);
			obj_savesystem.ini_str_options = ini_close();
			if (instance_exists(obj_option))
				obj_option.backbuffer = 2;
			with (create_transformation_tip(lang_get_value("option_controls_saved")))
			{
				depth = -700;
				alarm[1] = 100;
			}
			instance_destroy();
		}
		else
			fmod_event_one_shot("event:/sfx/ui/select");
	}
	else if (key_select > -1 && key_jump)
	{
		selecting = true;
		startbuffer = 1;
	}
}
else if (keyboard_check_pressed(vk_anykey))
{
	for (i = 0; i < array_length(input); i++)
	{
		if (variable_global_get(input[i][0]) == keyboard_key)
			variable_global_set(input[i][0], -4);
	}
	startbuffer = 5;
	variable_global_set(input[key_select][0], keyboard_key);
	selecting = false;
}
