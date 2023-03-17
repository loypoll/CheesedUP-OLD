with (obj_player)
{
	if place_meeting(x, y + 1, other)
	if (place_meeting(x, y + 1, obj_stairs) && !check_wall(other.x + 16, y + 1) && !check_wall(x, y + 1) && key_down && (state == states.crouch or ((character == "S" or character == "M") && (state == states.normal or state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
	{
		y += 5;
		state = states.ladder;
		y = floor(y);
		if ((y % 2) == 1)
			y -= 1;
	}
}
