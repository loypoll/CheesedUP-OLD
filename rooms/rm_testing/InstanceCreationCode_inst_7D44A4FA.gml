func = function()
{
	if (!active && argument0.state == 84)
	{
		active = true;
		obj_secretmanager.totems++;
	}
};
stepfunc = function()
{
	if (active)
	{
		with (instance_place(x, y, obj_totem))
			sprite_index = spr_totemcheese_pep;
	}
};
visible = false;
