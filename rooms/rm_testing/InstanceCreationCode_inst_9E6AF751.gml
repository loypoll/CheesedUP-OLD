trigger = 3;
stepfunc = function()
{
	active = false;
	if (place_meeting(x, y, obj_baddie))
		active = true;
	with (obj_player)
	{
		if (state == 55 && place_meeting(x, y, other))
			other.active = true;
	}
};
