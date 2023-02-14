depth = -99;
scr_init_input();
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
scr_pauseicon_add(spr_pauseicons, 4);
scr_pauseicon_add(spr_pauseicons, 5);
scr_pauseicon_add(spr_pauseicons, 6);
scr_pauseicon_add(spr_pauseicons, 7, 8, 8);

#region categories

var categories = create_menu_fixed(0, 0, 0, 48, -4);
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
	/*
	obj_option.key_jump = false;
	instance_create_unique(0, 0, obj_keyconfig);
	*/
	menu_goto(4);
});
array_push(menus, categories);

#endregion
#region audio menu

var audio_menu = create_menu_fixed(1, 1, 150, 40);
add_option_press(audio_menu, 0, "option_back", function()
{
	menu_goto(0);
	fmod_event_instance_stop(global.snd_slidermaster, true);
	fmod_event_instance_stop(global.snd_slidermusic, true);
	fmod_event_instance_stop(global.snd_slidersfx, true);
});

add_option_slide(audio_menu, 1, "option_master", function(val)
{
	global.option_master_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_master_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfxmaster").value = global.option_master_volume * 100;

add_option_slide(audio_menu, 2, "option_music", function(val)
{
	global.option_music_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_music_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidermusic").value = global.option_music_volume * 100;

add_option_slide(audio_menu, 3, "option_sfx", function(val)
{
	global.option_sfx_volume = val / 100;
	set_audio_config(false);
}, function(val)
{
	global.option_sfx_volume = val / 100;
	set_audio_config();
}, "event:/sfx/ui/slidersfx").value = global.option_sfx_volume * 100;

add_option_toggle(audio_menu, 4, "option_unfocus", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "unfocus_mute", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_unfocus_mute = val;
}).value = global.option_unfocus_mute;
array_push(menus, audio_menu);

#endregion
#region video menu

var video_menu = create_menu_fixed(2, 1, 150, 40);
add_option_press(video_menu, 0, "option_back", function()
{
	menu_goto(0);
});

var modes = [create_option_value("option_off", 0, true), create_option_value("option_exclusive", 1, true), create_option_value("option_borderless", 2, true)];
add_option_multiple(video_menu, 1, "option_fullscreen", modes, function(val)
{
	screen_apply_fullscreen(val);
	ini_open_from_string(obj_savesystem.ini_str_options);
	global.option_fullscreen = val;
	ini_write_real("Option", "fullscreen", val);
	obj_savesystem.ini_str_options = ini_close();
}).value = global.option_fullscreen;

var res = [];
for (var i = 0; i < array_length(global.resolutions[obj_screensizer.aspect_ratio]); i++)
{
	var b = global.resolutions[obj_screensizer.aspect_ratio][i];
	array_push(res, create_option_value(concat(b[0], "X", b[1]), i, false));
}

add_option_multiple(video_menu, 2, "option_resolution", res, function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "resolution", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_resolution = val;
	screen_apply_size();
}).value = global.option_resolution;

add_option_toggle(video_menu, 4, "option_texfilter", function(val)
{
    ini_open_from_string(obj_savesystem.ini_str_options);
    ini_write_real("Option", "texfilter", val);
    obj_savesystem.ini_str_options = ini_close();
    global.option_texfilter = val;
}
).value = global.option_texfilter;

add_option_toggle(video_menu, 4, "option_hud", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "hud", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_hud = val;
}).value = global.option_hud;

array_push(menus, video_menu);

#endregion
#region game menu

var game_menu = create_menu_fixed(3, 1, 150, 40);
add_option_press(game_menu, 0, "option_back", function()
{
	menu_goto(0);
});

add_option_toggle(game_menu, 1, "option_vibration", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "vibration", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_vibration = val;
}).value = global.option_vibration;

var lang = [];
var key = ds_map_find_first(global.lang_map);
for (i = 0; i < ds_map_size(global.lang_map); i++)
{
	var l = ds_map_find_value(global.lang_map, key);
	array_push(lang, create_option_value(ds_map_find_value(l, "display_name"), key, false));
	key = ds_map_find_next(global.lang_map, key);
}

var lang_option = add_option_multiple(game_menu, 2, "option_lang", lang, function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_string("Option", "lang", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_lang = val;
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

add_option_toggle(game_menu, 3, "option_timer", function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer = val;
}).value = global.option_timer;

add_option_multiple(game_menu, 4, "option_timer_type", [create_option_value("option_timer_level", 0), create_option_value("option_timer_save", 1)], function(val)
{
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Option", "timer_type", val);
	obj_savesystem.ini_str_options = ini_close();
	global.option_timer_type = val;
}).value = global.option_timer_type;

array_push(menus, game_menu);

#endregion
#region controls menu

var controls_menu = create_menu_fixed((4 << 0), (1 << 0), 150, 40);
add_option_press(controls_menu, 0, "option_back", function() {
    menu_goto((0 << 0));
});
add_option_press(controls_menu, 1, "option_keyboard", function()
{
    obj_option.key_jump = false;
    instance_create_unique(0, 0, obj_keyconfig);
});
add_option_press(controls_menu, 2, "option_controller", function() {
    menu_goto((5 << 0));
});
add_option_press(controls_menu, 3, "option_reset_config", function()
{
    ini_open_from_string(obj_savesystem.ini_str_options)
    ini_section_delete("ControlsKeys")
    ini_section_delete("ControllerButton")
    ini_section_delete("ControllerConfig")
    scr_initinput(false)
    obj_savesystem.ini_str_options = ini_close()
    with (obj_option)
    {
        for (i = 0; i < array_length(menus); i++)
        {
            b = menus[i]
            if (b.menu_id == (5 << 0) || b.menu_id == (7 << 0))
            {
                for (var j = 0; j < array_length(b.options); j++)
                {
                    var q = b.options[j]
                    if (q.name == "option_deadzone")
                        q.value = (global.gamepad_deadzone * 100)
                    else if (q.name == "option_deadzone_h")
                        q.value = (global.gamepad_deadzone_horizontal * 100)
                    else if (q.name == "option_deadzone_v")
                        q.value = (global.gamepad_deadzone_vertical * 100)
                    else if (q.name == "option_deadzone_press")
                        q.value = (global.gamepad_deadzone_press * 100)
                    else if (q.name == "option_deadzone_superjump")
                        q.value = (global.gamepad_deadzone_superjump * 100)
                    else if (q.name == "option_controller_superjump")
                        q.value = global.gamepad_superjump
                    else if (q.name == "option_controller_groundpound")
                        q.value = global.gamepad_groundpound
                }
            }
        }
    }
    with (create_transformation_tip(lang_get_value("option_controls_resetted")))
    {
        depth = -700
        alarm[1] = 100
    }
});
array_push(menus, controls_menu)

#endregion
#region controller menu

var controller_menu = create_menu_fixed((5 << 0), (1 << 0), 150, 40, (4 << 0))
add_option_press(controller_menu, 0, "option_back", function() {
    menu_goto((4 << 0))
});
add_option_press(controller_menu, 1, "option_controller_binds", function(val)
{
    obj_option.key_jump = false;
    with (instance_create_unique(0, 0, obj_keyconfig))
    {
        controller = 1;
        array_pop(input);
        array_push(input, ["key_superjump"]);
        array_push(input, ["key_groundpound"]);
    }
});
add_option_press(controller_menu, 2, "option_deadzone_title", function(val) {
    menu_goto((7 << 0))
});
add_option_toggle(controller_menu, 3, "option_controller_superjump", function(val)
{
    global.gamepad_superjump = val;
    set_controller_config();
}).value = global.gamepad_superjump;

add_option_toggle(controller_menu, 4, "option_controller_groundpound", function(val)
{
    global.gamepad_groundpound = val;
    set_controller_config();
}).value = global.gamepad_groundpound;

array_push(menus, controller_menu)

#endregion
#region deadzones menu

var deadzones_menu = create_menu_fixed((7 << 0), (1 << 0), 150, 40, (5 << 0));
add_option_press(deadzones_menu, 0, "option_back", function() {
    menu_goto((5 << 0))
});
add_option_slide(deadzones_menu, 1, "option_deadzone", function(val)
{
    if (val > 90)
        val = 90
    global.gamepad_deadzone = (val / 100)
    set_controller_config()
}).value = (global.gamepad_deadzone * 100);

add_option_slide(deadzones_menu, 2, "option_deadzone_h", function(val)
{
    if (val > 90)
        val = 90
    global.gamepad_deadzone_horizontal = (val / 100)
    set_controller_config()
}).value = (global.gamepad_deadzone_horizontal * 100);

add_option_slide(deadzones_menu, 3, "option_deadzone_v", function(val)
{
    if (val > 90)
        val = 90
    global.gamepad_deadzone_vertical = (val / 100)
    set_controller_config()
}).value = (global.gamepad_deadzone_vertical * 100);

add_option_slide(deadzones_menu, 4, "option_deadzone_press", function(val)
{
    if (val > 90)
        val = 90
    global.gamepad_deadzone_press = (val / 100)
    set_controller_config()
}).value = (global.gamepad_deadzone_press * 100);

add_option_slide(deadzones_menu, 5, "option_deadzone_superjump", function(val)
{
    global.gamepad_deadzone_superjump = (val / 100)
    set_controller_config()
}).value = (global.gamepad_deadzone_superjump * 100);

array_push(menus, deadzones_menu);

#endregion
