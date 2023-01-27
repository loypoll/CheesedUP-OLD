var i = 0;
repeat (sprite_get_number(spr_pizzacar_debris))
{
	with (create_debris(x, y, 4047))
	{
		image_index = i;
		vsp = irandom_range(-7, -11);
		if (i == 4)
			vsp = irandom_range(-10, -14);
	}
	i++;
}
