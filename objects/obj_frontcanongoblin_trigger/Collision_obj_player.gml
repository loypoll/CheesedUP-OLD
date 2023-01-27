var _found = false;
with (obj_frontcanongoblin)
{
	if (state != 89)
		_found = true;
}
if (!active && !_found)
{
	active = true;
	start = true;
	if (!instance_exists(obj_frontcanongoblin))
		instance_create(x, y, obj_frontcanongoblin);
	else
	{
		with (obj_frontcanongoblin)
		{
			destroyed = false;
			state = 0;
		}
	}
	with (obj_frontcanongoblin_trigger)
		active = true;
}
else if (!start)
{
	with (obj_frontcanongoblin)
	{
		if (state != 89 && !destroyed)
		{
			destroyed = false;
			destroybuffer = 50;
			state = 89;
			captain_sprite = spr_captaingoblin_end;
			canon_sprite = spr_captaingoblin_canon;
			captain_index = 0;
			alarm[0] = -1;
		}
	}
}
