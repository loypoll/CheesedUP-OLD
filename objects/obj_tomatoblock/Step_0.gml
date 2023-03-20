with (obj_player)
{
	if (state != states.dead && place_meeting(x, y + 1, other))
	{
		jumpstop = true;
		vsp = -11;
		other.image_index = 0;
		other.image_speed = 0.35;
		grounded = false;
		if (state == states.machslide)
			state = states.jump;
		if (state == states.normal or state == states.freefall)
			state = states.jump;
		if (state == states.climbwall)
			state = states.mach2;
	}
}
