if (state == states.idle or (state == states.actor && substate == states.idle))
{
	repeat (irandom_range(1, 3))
		create_heatpuff(x + irandom_range(-50, 50), y - 70);
	alarm[0] = 8;
}
