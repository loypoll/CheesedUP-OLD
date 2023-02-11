piledriver = true;
active = false;
step = function()
{
	with (obj_player)
	{
		if (place_meeting(x, y, other) && state != 76 && state != 61)
			other.piledriver = false;
	}
	if (piledriver && !active && !place_meeting(x, y, obj_secretbigblock))
	{
		notification_push(notifs.destroyed_area, [room]);
		active = true;
	}
};
