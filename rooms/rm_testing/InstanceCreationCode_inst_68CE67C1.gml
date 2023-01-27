func = function()
{
	if (!active && argument0.state == 42)
	{
		active = true;
		obj_secretmanager.hittriggers++;
		with (argument0)
			scr_pummel();
	}
};
