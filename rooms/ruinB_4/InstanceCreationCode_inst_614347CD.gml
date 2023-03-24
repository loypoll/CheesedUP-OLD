stepfunc = function()
{
	if !place_meeting(x, y, obj_key)
	{
		with obj_player
		{
			if state != states.keyget
				instance_destroy(other);
		}
	}
}
