scr_getinput();
index += 0.1;
key_jump = key_jump || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);
switch (state)
{
	case 18:
		jumpscarecount++;
		currentselect = -1;
		if ((keyboard_check_pressed(vk_anykey) || scr_checkanygamepad(obj_inputAssigner.player_input_device[0]) != -4) && !instance_exists(obj_mainmenu_jumpscare))
		{
			state = 8;
			currentselect = -1;
			visualselect = -1;
			darkcount = 7;
			dark = false;
			darkbuffer = 5;
			jumpscarecount = 0;
			fmod_event_one_shot("event:/sfx/ui/lightswitch");
			with (obj_music)
				fmod_event_instance_set_parameter(music.event, "state", 1, true);
		}
		if (jumpscarecount > 2400 && !instance_exists(obj_mainmenu_jumpscare))
		{
			instance_create(480, 270, obj_mainmenu_jumpscare);
			fmod_event_one_shot("event:/sfx/enemies/jumpscare");
		}
		break;
	case 8:
		if (darkbuffer > 0)
			darkbuffer--;
		else
		{
			dark = !dark;
			if (darkcount > 0)
			{
				darkcount--;
				if (dark)
					darkbuffer = 2 + irandom(3);
				else
					darkbuffer = 6 + irandom(5);
				if (darkcount <= 0)
				{
					dark = false;
					darkbuffer = 40;
				}
			}
			else
			{
				currentselect = 0;
				visualselect = 0;
				dark = false;
				state = 0;
				sprite_index = spr_titlepep_forwardtoleft;
				image_index = 0;
			}
		}
		break;
	case 0:
		if (key_start && !instance_exists(obj_option))
		{
			with (instance_create(0, 0, obj_option))
				backbuffer = 2;
			break;
		}
	case 183:
		deleteselect += (key_left2 + key_right2);
		deleteselect = clamp(deleteselect, 0, 1);
		if (key_jump)
		{
			if (deleteselect == 0)
			{
				var f = concat("saves/saveData", currentselect + 1, ".ini");
				if (file_exists(f))
					file_delete(f);
				if (currentselect == 0)
					global.percentage_1 = 0;
				else if (currentselect == 1)
					global.percentage_2 = 0;
				else if (currentselect == 2)
					global.percentage_3 = 0;
				global.game_started[currentselect] = false;
				global.game_snotty[currentselect] = false;
				global.game_john[currentselect] = false;
				global.game_judgement[currentselect] = "none";
				global.game_palette[currentselect] = 1;
				global.game_palettetexture[currentselect] = -4;
				fmod_event_one_shot_3d("event:/sfx/misc/explosion", 480, 270);
				fmod_event_one_shot_3d("event:/sfx/mort/mortdead", 480, 270);
				with (obj_menutv)
				{
					if (trigger == other.currentselect && sprite_index == selectedspr)
						sprite_index = transspr;
				}
				with (obj_camera)
				{
					shake_mag = 4;
					shake_mag_acc = 5 / room_speed;
				}
			}
			state = 0;
		}
		break;
	case 289:
		exitselect += (key_left2 + key_right2);
		exitselect = clamp(exitselect, 0, 1);
		if (key_jump)
		{
			if (exitselect == 0)
				game_end();
			else
				state = 0;
		}
		break;
}
if (state != 18 && state != 8)
	extrauialpha = Approach(extrauialpha, 1, 0.1);
if (currentselect == 0)
	percentage = global.percentage_1;
else if (currentselect == 1)
	percentage = global.percentage_2;
else if (currentselect == 2)
	percentage = global.percentage_3;
if (currentselect != -1)
{
	snotty = global.game_snotty[currentselect];
	john = global.game_john[currentselect];
	judgement = global.game_judgement[currentselect];
}
perstatus_icon = floor(percentage / 14.285714285714286);
if (state != 18 && state != 8)
{
	var a = floor(abs(percvisual - percentage) / 10) + 1;
	percvisual = Approach(percvisual, percentage, a);
}
if (perstatus_icon > (sprite_get_number(spr_percentstatemenu) - 1))
	perstatus_icon = sprite_get_number(spr_percentstatemenu) - 1;
if (percentage >= 101)
	perstatus_icon = 8;
with (obj_menutv)
{
	if (trigger == other.currentselect)
		selected = true;
	else
		selected = false;
}
