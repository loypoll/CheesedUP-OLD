func = function()
{
	if (active == 0 && argument0.state == states.backbreaker)
	{
		active = true;
		obj_secretmanager.touchedtriggers += 1;
	}
};
