trigger = 6;
func = function()
{
	if (!active)
	{
		if (following_has_follower(1029))
		{
			active = true;
			instance_destroy(obj_alienfollow);
		}
	}
};
