/// @description restart
var rm = roomtorestart;

scr_pause_stop_sounds();
if REMIX
	clear_particles();

sound_stop_all(true);

global.levelattempts++;
ds_list_clear(global.saveroom);
ds_list_clear(global.baddieroom);
ds_list_clear(global.debris_list);
ds_list_clear(global.collect_list);
alarm[4] = 1;
obj_music.music = -4;
instance_destroy(obj_fadeout);
global.levelreset = false;
scr_playerreset();
global.levelreset = true;
obj_player1.targetRoom = rm;
obj_player2.targetRoom = rm;

scr_room_goto(rm);
discord_start_timer();

var _d = "A";
if (rm == boss_pizzaface)
	_d = "B";
obj_player1.targetDoor = _d;
obj_player1.restartbuffer = 15;
obj_player2.restartbuffer = 15;
if (instance_exists(obj_player2))
	obj_player2.targetDoor = _d;
if (rm == boss_pizzaface or rm == boss_noise or rm == boss_pepperman or rm == boss_fakepep or rm == boss_vigilante)
	global.bossintro = true;
