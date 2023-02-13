with (other)
{
	if (other.hurtplayer == 0)
	{
		if (key_jump2)
		{
			vsp = -20;
			if (state == 0 || state == states.jump || hsp == 0)
			{
				sprite_index = spr_playerV_superjump;
				state = 92;
			}
			image_index = 0;
			jumpAnim = true;
			jumpstop = true;
			other.hurtplayer = true;
		}
	}
}
