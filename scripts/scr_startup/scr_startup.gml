#macro REMIX global.gameplay
#macro STEAM extension_exists("Steamworks") // TODO check if this works when building other platforms
#macro debug (GM_build_type == "run")

if os_type == os_gxgames
{
	show_message_async("You have your build settings set to GX.games!!!\nChange it to \"Test\" or \"Windows\"!!!");
	game_end();
}

// drm
if room_next(room_first) != room_firstboot
	game_end();
global.ANON_B007 = array_create(5, false);

// initialize
scr_get_languages();
pal_swap_init_system_fix(shd_pal_swapper, true);

// fonts
global.bigfont = font_add_sprite_ext(spr_font, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.1234567890:", true, 0);
global.smallfont = font_add_sprite_ext(spr_smallerfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZ!.:?1234567890", true, 0);
global.tutorialfont = font_add_sprite_ext(spr_tutorialfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!,.:0123456789'?-", true, 2);
global.creditsfont = font_add_sprite_ext(spr_creditsfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz.:!0123456789?'\"ÁÉÍÓÚáéíóú_-[]▼()&#风雨廊桥전태양*яиБжидГзвбнль", true, 2);
global.moneyfont = font_add_sprite_ext(spr_stickmoney_font, "0123456789$-", true, 0);

global.font_map = ds_map_create();
ds_map_set(global.font_map, "bigfont_en", global.bigfont);
ds_map_set(global.font_map, "smallfont_en", global.smallfont);
ds_map_set(global.font_map, "tutorialfont_en", global.tutorialfont);
ds_map_set(global.font_map, "creditsfont_en", global.creditsfont);

global.collectfont = font_add_sprite_ext(spr_font_collect, "0123456789", true, 0);
global.combofont = font_add_sprite_ext(spr_font_combo, "0123456789/:", true, 0);
global.combofont2 = font_add_sprite_ext(spr_tv_combobubbletext, "0123456789", true, 0);
global.wartimerfont1 = font_add_sprite_ext(spr_wartimer_font1, "1234567890", true, 0);
global.wartimerfont2 = font_add_sprite_ext(spr_wartimer_font2, "1234567890", true, 0);
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:;?▯|*/',\"()=-+@█%~ÁÉÍÓÚáéíóúÑñ[]<>$", true, 0);

// settings
ini_open("saveData.ini");
global.gameplay = ini_read_real("Modded", "gameplay", true); // misc. improvements on or off?

// gameplay settings
global.uppercut = ini_read_real("Modded", "uppercut", true); // *buffed uppercut*
global.poundjump = ini_read_real("Modded", "poundjump", false);
global.attackstyle = ini_read_real("Modded", "attackstyle", 0); // grab, kungfu, shoulderbash
global.shootstyle = ini_read_real("Modded", "shootstyle", 0); // nothing, pistol, breakdance
global.doublegrab = ini_read_real("Modded", "doublegrab", 0); // nothing, shoulderbash, tumble, chainsaw
global.autoparry = ini_read_real("Modded", "autoparry", false);
global.shootbutton = ini_read_real("Modded", "shootbutton", 0); // 0 replace grab, 1 move to A, 2 only shotgun
global.heatmeter = ini_read_real("Modded", "heatmeter", false);

// visual settings
global.panicbg = ini_read_real("Modded", "panicbg", true);
global.panictilt = ini_read_real("Modded", "panictilt", false);
ini_close();

// crash handler
exception_unhandled_handler
(
	function(e)
	{
	    show_debug_message(string(e));
		show_message("The game crashed! longMessage:\n\n" + e.longMessage);
		
		stop_music();
		sound_stop_all();
		sound_play_centered(sfx_hurt);
		
		var _f = file_text_open_write("crash_log.txt");
		file_text_write_string(_f, string(e));
		file_text_close(_f);
	}
);

// etc
global.jeofmode = false;
