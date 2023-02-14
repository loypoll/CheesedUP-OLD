with (other)
{
	if (state != states.gotoplayer)
	{
		if (state == 53 || state == 32 || state == states.slipnslide || state == 184 || state == states.grind || state == states.tumble || state == states.cheeseball || state == states.knightpepslopes || state == 65 || state == 121 || state == states.mach2)
		{
			other.sprite_index = spr_sidespringblock_bounce;
			other.image_index = 0;
			if (xscale != other.image_xscale)
				xscale = other.image_xscale;
		}
	}
}
