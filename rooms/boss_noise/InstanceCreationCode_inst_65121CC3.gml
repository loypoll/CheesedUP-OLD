bossspr = spr_vsnoise;
boss_hp = 16;
vstitle = 1873;
boss_hpsprite = spr_bossfight_noiseHP;
boss_palette = 1422;
boss_func = function()
{
	var eh = 0;
	var p = 0;
	with (obj_noiseboss)
	{
		eh = elitehit;
		p = phase;
		if (((p == 1 && state == 295) || instance_exists(obj_noiseballooncrash)) && phase == 1)
			eh = 0;
	}
	if (p == 1)
		boss_hp = eh;
	else if (p == 2)
		boss_hp = eh;
	else if (p == 0)
		boss_hp = 0;
};
