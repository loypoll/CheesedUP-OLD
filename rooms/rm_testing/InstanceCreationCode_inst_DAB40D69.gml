trigger = 1;
func = function()
{
	if (!active)
	{
		if (argument0.state == states.freefallland)
			active = true;
	}
};
