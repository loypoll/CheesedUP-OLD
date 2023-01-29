depth = -99;
stickpressed = false;
slidecount = 0;
slidebuffer = 0;
bg_alpha = [1, 0, 0, 0, 0];
bg_x = 0;
bg_y = 0;
menus = [];
lastmenu = 0;
menu = 0;
optionselected = 0;
backbuffer = 0;
pause_icons = array_create(0);
scr_pauseicon_add(1472, 4);
scr_pauseicon_add(1472, 5);
scr_pauseicon_add(1472, 6);
scr_pauseicon_add(1472, 7, 8, 8);
var categories = create_menu_fixed(0, 0, 0, 48);
add_option_press(categories, 0, "option_audio", function()
{
	menu_goto(1);
});
add_option_press(categories, 1, "option_video", function()
{
	menu_goto(2);
});
add_option_press(categories, 2, "option_game", function()
{
	menu_goto(3);
});
add_option_press(categories, 3, "option_controls", function()
{
	obj_option.key_jump = false;
	instance_create_unique(0, 0, obj_keyconfig);
});
array_push(menus, categories);
var audio_menu = create_menu_fixed(1, 1, 150, 40);
add_option_press(audio_menu, 0, "option_back", function()
{
	menu_goto(0);
	fmod_event_instance_stop(global.snd_slidermaster, true);
	fmod_event_instance_stop(global.snd_slidermusic, true);
	fmod_event_instance_stop(global.snd_slidersfx, true);
});
add_option_slide(audio_menu, 1, "option_master", function()
{
	global.option_master_volume = argument0 / 100;
	set_audio_config(false);
}, function()
{
	global.option_master_volume = argument0 / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfxmaster").value = global.option_master_volume * 100;
add_option_slide(audio_menu, 2, "option_music", function()
{
	global.option_music_volume = argument0 / 100;
	set_audio_config(false);
}, function()
{
	global.option_music_volume = argument0 / 100;
	set_audio_config();
}, "event:/sfx/ui/slidermusic").value = global.option_music_volume * 100;
add_option_slide(audio_menu, 3, "option_sfx", function()
{
	global.option_sfx_volume = argument0 / 100;
	set_audio_config(false);
}, function()
{
	global.option_sfx_volume = argument0 / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfx").value = global.option_sfx_volume * 100;
add_option_toggle(audio_menu, 4, "option_unfocus", function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "unfocus_mute", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_unfocus_mute = argument0;
}).value = global.option_unfocus_mute;
array_push(menus, audio_menu);
var video_menu = create_menu_fixed(2, 1, 150, 40);
add_option_press(video_menu, 0, "option_back", function()
{
	menu_goto(0);
});
var modes = [create_option_value("option_off", 0, true), create_option_value("option_exclusive", 1, true), create_option_value("option_borderless", 2, true)];
add_option_multiple(video_menu, 1, "option_fullscreen", modes, function()
{
	screen_apply_fullscreen(argument0);
	ini_open_from_string(obj_savesystem.ini_str_options);
	global.option_fullscreen = argument0;
	ini_write_real("Option", "fullscreen", argument0);
	obj_savesystem.ini_str_options = ini_close();
}).value = global.option_fullscreen;
var res = [];
for (var i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
{
	var b = global.resolutions[obj_screensizer.aspect_ratio][i];
	array_push(res, create_option_value(concat(b[0], "X", b[1]), i, false));
}
add_option_multiple(video_menu, 2, "option_resolution", res, function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "resolution", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_resolution = argument0;
	screen_apply_size();
}).value = global.option_resolution;
add_option_toggle(video_menu, 4, "option_hud", function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "hud", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_hud = argument0;
}).value = global.option_hud;
array_push(menus, video_menu);
var game_menu = create_menu_fixed(3, 1, 150, 40);
add_option_press(game_menu, 0, "option_back", function()
{
	menu_goto(0);
});
add_option_toggle(game_menu, 1, "option_vibration", function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "vibration", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_vibration = argument0;
}).value = global.option_vibration;
var lang = [];
var key = ds_map_find_first(global.lang_map);
for (i = 0; i < ds_map_size(global.lang_map); i++)
{
	var l = ds_map_find_value(global.lang_map, key);
	array_push(lang, create_option_value(ds_map_find_value(l, "display_name"), key, false));
	key = ds_map_find_next(global.lang_map, key);
}
var lang_option = add_option_multiple(game_menu, 2, "option_lang", lang, function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_string("Option", "lang", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_lang = argument0;
	global.lang = global.option_lang;
});
var r = 0;
for (i = 0; i < array_length(lang); i++)
{
	if (lang[i].value == global.option_lang)
	{
		r = i;
		break;
	}
}
lang_option.value = r;
add_option_toggle(game_menu, 3, "option_timer", function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer = argument0;
}).value = global.option_timer;
add_option_multiple(game_menu, 4, "option_timer_type", [create_option_value("option_timer_level", 0), create_option_value("option_timer_save", 1)], function()
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer_type", argument0);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer_type = argument0;
}).value = global.option_timer_type;
array_push(menus, game_menu);
