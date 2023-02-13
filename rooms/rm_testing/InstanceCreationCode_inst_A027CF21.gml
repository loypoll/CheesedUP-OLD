func = function()
{
	if (!active && argument0.state == states.handstandjump)
	{
		active = true;
		obj_secretmanager.hittriggers++;
		with (argument0)
			scr_pummel();
	}
};
