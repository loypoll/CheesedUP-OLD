alarm[7] = 10;
if (state == states.mach1 || state == states.pizzagoblinthrow || state == 91 || state == 23)
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if (other.state != states.pizzagoblinthrow && other.state != 23)
			playerid = other.id;
	}
}
