with (obj_player1)
{
	global.player_damage = 0;
	global.peppino_damage = 0;
	global.bossplayerhurt = false;
	global.pistol = false;
	global.leveltorestart = -4;
	global.leveltosave = -4;
	pistolanim = -4;
	targetDoor = "HUB";
	targetRoom = backtohubroom;
	room = backtohubroom;
	x = backtohubstartx;
	y = backtohubstarty;
	x = backtohubstartx;
	y = backtohubstarty - (obj_screensizer.actual_height * 2);
	state = 290;
	sprite_index = spr_player_slipbanan1;
	image_index = 10;
}
with (instance_create(0, 0, obj_backtohub_fadeout))
{
	fadealpha = 1;
	fadein = false;
	pos_player = true;
}
