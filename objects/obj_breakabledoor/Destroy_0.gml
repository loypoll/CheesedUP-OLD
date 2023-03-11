if (ds_list_find_index(global.saveroom, id) == -1)
{
	scr_sound_multiple(sfx_breakblock, x + 16, y + 50);
	repeat (4)
	{
		with (create_debris(x + 16, y + 50, spr_wooddebris))
		{
			vsp = random_range(-8, -6);
			hsp = random_range(-4, 4);
		}
	}
	ds_list_add(global.saveroom, id);
}
