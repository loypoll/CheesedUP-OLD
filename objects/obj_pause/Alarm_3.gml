/// @description back to hub
pause = false;
scr_pause_stop_sounds();
var rm = room;
if (!hub)
{
	if REMIX
		clear_particles();
	sound_stop_all(true);
	
	pause = false;
	scr_pause_activate_objects();
	
	obj_player1.targetRoom = Realtitlescreen;
	obj_player2.targetRoom = Realtitlescreen;
	room = Realtitlescreen;
	with (obj_player1)
	{
		character = "P";
		scr_characterspr();
	}
	global.leveltosave = -4;
	global.leveltorestart = -4;
	scr_playerreset();
	alarm[0] = 2;
	obj_player1.state = states.titlescreen;
	obj_player2.state = states.titlescreen;
	obj_player1.targetDoor = "A";
	if (instance_exists(obj_player2))
		obj_player2.targetDoor = "A";
	global.cowboyhat = false;
	global.coop = false;
}
else
{
	if REMIX
		sound_stop_all(true);
	
	scr_pause_activate_objects();
	
	with (instance_create(0, 0, obj_backtohub_fadeout))
		fadealpha = 0.9;
	scr_playerreset();
	global.levelreset = true;
	obj_player1.targetDoor = "HUB";
	if (instance_exists(obj_player2))
		obj_player2.targetDoor = "HUB";
	global.leveltorestart = -4;
	global.leveltosave = -4;
}
if (rm == boss_pizzaface or rm == boss_noise or rm == boss_pepperman or rm == boss_fakepep or rm == boss_vigilante)
	global.bossintro = true;
