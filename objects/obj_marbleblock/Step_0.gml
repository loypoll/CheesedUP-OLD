with (obj_player)
{
	if (state == 121 && movespeed > 16 && place_meeting(x + hsp, y, other))
		instance_destroy(other);
}
