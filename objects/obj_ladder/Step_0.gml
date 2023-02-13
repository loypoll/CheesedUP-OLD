if (place_meeting(x, y - 1, obj_player1))
{
	with (obj_player1)
	{
		if (place_meeting(x, y + 1, obj_ladder) && !place_meeting(other.x + 16, y + 1, obj_solid) && key_down && (state == 100 || ((character == "S" || character == "M") && (state == 0 || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
		{
			y += 5;
			state = 93;
			x = other.x + 16;
			y = floor(y);
			if ((y % 2) == 1)
				y -= 1;
		}
		if (key_down && place_meeting(x, y + 1, obj_ladder) && !place_meeting(other.x + 16, y + 1, obj_solid) && state == 260 && place_meeting(x, y + 1, obj_platform))
		{
			state = 261;
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
				{
					wait = true;
					instance_create(x, y, obj_genericpoofeffect);
				}
			}
			y += 5;
			brick = false;
			x = other.x + 16;
			y = floor(y);
			if ((y % 2) == 1)
				y -= 1;
		}
	}
}
if (instance_exists(obj_player2))
{
	if (place_meeting(x, y - 2, obj_player2))
	{
		with (obj_player2)
		{
			if (place_meeting(x, y + 2, obj_ladder) && !place_meeting(other.x + 16, y + 2, obj_solid) && key_down && (state == 100 || (character == "S" && (state == 0 || state == states.mach1))) && place_meeting(x, y + 1, obj_platform))
			{
				y += 5;
				state = 93;
				x = other.x + 16;
				y = floor(y);
				if ((y % 2) == 1)
					y -= 1;
			}
		}
	}
}
