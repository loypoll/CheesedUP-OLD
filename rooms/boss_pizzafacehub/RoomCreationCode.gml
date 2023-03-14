notification_push(notifs.boss_dead, [boss_pizzafacehub]);
global.gameframe_caption_text = "Defeated an idiot at the top of the Pizza Tower";

ini_open_from_string(obj_savesystem.ini_str);
ini_write_real("w5stick", "bosskey", true);

// new save
var _hats = global.hats;
if ini_read_real("Hats", global.leveltosave, 0) < _hats
	ini_write_real("Hats", global.leveltosave, _hats);

var _extrahats = global.extrahats;
if ini_read_real("Extrahats", global.leveltosave, 0) < _extrahats
	ini_write_real("Extrahats", global.leveltosave, _extrahats);

var _rank = "d";
var maxhats = 6 + global.srank;
var currhats = _extrahats + _hats;
if currhats >= maxhats && !global.bossplayerhurt
	_rank = "p";
else if currhats >= maxhats - 2
	_rank = "s";
else if currhats >= maxhats - 4
	_rank = "a";
else if currhats >= maxhats - 6
	_rank = "b";
else if currhats >= maxhats - 8
	_rank = "c";
global.rank = _rank;
scr_write_rank(global.leveltosave);

obj_savesystem.ini_str = ini_close();
gamesave_async_save();

with (obj_player1)
{
	tauntstoredstate = states.normal;
	landAnim = true;
	state = states.animation;
	buffer = 100;
	sprite_index = spr_slipbanan2;
	image_index = sprite_get_number(spr_slipbanan2) - 1;
	image_speed = 0.35;
}
global.roommessage = "PIZZA TOWER ISLAND";
global.leveltorestart = tower_finalhallway;
