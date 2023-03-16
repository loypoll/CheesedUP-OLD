alarm[7] = 10;
if (state == states.mach1 or state == states.pizzagoblinthrow or state == states.tackle or state == states.slap)
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if (other.state != states.pizzagoblinthrow && other.state != states.slap)
			playerid = other.id;
	}
}
