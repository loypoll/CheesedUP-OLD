with (other)
{
	if (state != 186 && state != 9)
	{
		image_index = 0;
		state = 9;
		vsp = -21;
		sprite_index = spr_scaredjump1;
		scr_monster_activate();
	}
}
