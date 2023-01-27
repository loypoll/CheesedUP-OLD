alarm[7] = 10;
if (state == 103 || state == 129 || state == 91 || state == 23)
{
	with (create_red_afterimage(x, y, sprite_index, image_index - 1, image_xscale))
	{
		if (other.state != 129 && other.state != 23)
			playerid = other.id;
	}
}
