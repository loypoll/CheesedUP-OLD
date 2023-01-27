with (other)
{
	if (state != 186)
	{
		if (state == 53 || state == 32 || state == 94 || state == 184 || state == 78 || state == 5 || state == 21 || state == 38 || state == 65 || state == 121 || state == 104)
		{
			other.sprite_index = spr_sidespringblock_bounce;
			other.image_index = 0;
			if (xscale != other.image_xscale)
				xscale = other.image_xscale;
		}
	}
}
