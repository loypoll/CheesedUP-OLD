trigger = 7;
func = function()
{
	if (!active)
	{
		if (following_count(387) >= 3)
		{
			active = true;
			instance_destroy(obj_chickenfollow);
		}
	}
};
