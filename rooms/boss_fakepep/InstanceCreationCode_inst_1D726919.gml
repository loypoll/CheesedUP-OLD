var _first = true;
ini_open_from_string(obj_savesystem.ini_str);
if (ini_read_real("Game", "fakepepportrait", false))
	_first = false;
ini_write_real("Game", "fakepepportrait", true);
obj_savesystem.ini_str = ini_close();
if (_first)
{
	bossspr = spr_vsfakepep2;
	vstitle = 230;
}
else
{
	bossspr = spr_vsfakepep;
	vstitle = 1399;
}
boss_hp = 10;
boss_hpsprite = spr_bossfight_fakepephp;
boss_palette = 4045;
boss_columnmax = 3;
boss_hp_x += 50;
boss_func = function()
{
	var eh = 0;
	var p = 0;
	with (obj_fakepepboss)
	{
		eh = elitehit;
		p = phase;
	}
	if (p == 1)
		boss_hp = eh;
	else if (p == 2)
		boss_hp = eh;
	else if (p == 0)
	{
		boss_hp = 0;
		if (room == boss_fakepephallway)
			boss_hp = 1;
	}
};
