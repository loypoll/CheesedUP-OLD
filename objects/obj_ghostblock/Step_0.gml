with (obj_player)
{
	if (ghostdash && ghostpepper >= 3)
	{
		with (other)
		{
			if (place_meeting(x, y + 1, other) or place_meeting(x, y - 1, other) or place_meeting(x + 1, y, other) or place_meeting(x - 1, y, other))
				instance_destroy();
		}
	}
}
