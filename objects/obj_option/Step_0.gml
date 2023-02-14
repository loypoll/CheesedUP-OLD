var j = menu;
if (instance_exists(obj_keyconfig) || menu == (5 << 0) || menu == (7 << 0))
    j = 4;
if (menu >= (4 << 0) && menu <= (7 << 0))
    j = 4;
for (var i = 0; i < array_length(bg_alpha); i++)
{
	if (i == j)
		bg_alpha[i] = Approach(bg_alpha[i], 1, 0.1);
	else
		bg_alpha[i] = Approach(bg_alpha[i], 0, 0.05);
}
bg_x -= 1;
bg_y -= 1;
if (instance_exists(obj_keyconfig))
	exit;
scr_getinput();
key_jump = (key_jump || (global.key_start != vk_return && keyboard_check_pressed(vk_return)) || (global.key_start != vk_space && keyboard_check_pressed(vk_space)));
key_back = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face2));
if (backbuffer > 0)
{
	backbuffer--;
	key_jump = false;
	key_back = false;
}
var m = menus[menu];
var move = key_down2 - key_up2;
if (move != 0)
{
	slidebuffer = 0;
	slidecount = 0;
}
var os = optionselected;
optionselected += move;
optionselected = clamp(optionselected, 0, array_length(m.options) - 1);
if (os != optionselected)
	fmod_event_one_shot("event:/sfx/ui/step");
var option = m.options[optionselected];
var move2 = key_left2 + key_right2;
switch (option.type)
{
	case 2:
		if (key_jump && option.func != -4)
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			option.func();
		}
		break;
	case 0:
		if (key_jump || -key_left2 || key_right2)
		{
			fmod_event_one_shot("event:/sfx/ui/select");
			option.value = !option.value;
			if (option.on_changed != -4)
				option.on_changed(option.value);
		}
		break;
	case 1:
		if (move2 != 0)
		{
			fmod_event_one_shot("event:/sfx/ui/step");
			option.value += move2;
			if (option.value > (array_length(option.values) - 1))
				option.value = 0;
			if (option.value < 0)
				option.value = array_length(option.values) - 1;
			if (option.on_changed != -4)
				option.on_changed(option.values[option.value].value);
		}
		break;
	case 3:
		move2 = key_left + key_right;
		if (move2 != 0 && slidebuffer <= 0)
		{
			option.moved = true;
			option.value += move2;
			option.value = clamp(option.value, 0, 100);
			slidebuffer = 1;
		}
		if (move2 != 0)
			option.moving = true;
		if (move2 == 0)
		{
			slidecount = 0;
			option.moving = false;
		}
		break;
}
for (i = 0; i < array_length(m.options); i++)
{
	var b = m.options[i];
	if (b.type == 3)
	{
		if (b.moved && (move2 == 0 || optionselected != i))
		{
			b.moved = false;
			b.moving = false;
			if (b.on_changed != -4)
				b.on_changed(b.value);
		}
		if (b.on_move != -4 && b.moving)
			b.on_move(b.value);
		if (b.sound != -4)
		{
			if (b.moving)
			{
				if (!fmod_event_instance_is_playing(b.sound))
					fmod_event_instance_play(b.sound);
			}
			else
				fmod_event_instance_stop(b.sound, true);
		}
	}
}
if (menu == 0)
	scr_pauseicons_update(optionselected);
else
	scr_pauseicons_update(-1);
if (slidebuffer > 0)
	slidebuffer--;
if ((key_back || key_slap2 || keyboard_check_pressed(vk_escape)) && !instance_exists(obj_keyconfig) && !instance_exists(obj_audioconfig))
{
	fmod_event_one_shot("event:/sfx/ui/back");
	if (menu == 0)
	{
		if (instance_exists(obj_mainmenuselect))
			obj_mainmenuselect.selected = false;
		instance_destroy();
	}
	else
	{
		for (i = 0; i < array_length(m.options); i++)
		{
			b = m.options[i];
			if (b.type == 3)
			{
				if (b.sound != -4)
					fmod_event_instance_stop(b.sound, true);
			}
		}
		menu_goto(m.backmenu);
	}
}
