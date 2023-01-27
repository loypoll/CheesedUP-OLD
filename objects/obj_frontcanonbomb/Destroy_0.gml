instance_create(x, y, obj_canonexplosion);
if (room != plage_shiptop)
{
	if (place_meeting(x, y + 50, obj_solid))
	{
		if (room != tower_escape9)
		{
			repeat (10)
			{
				with (create_debris(x, y, 2165))
					vsp = random_range(-7, -11);
			}
		}
		else
		{
			repeat (4)
			{
				with (create_debris(x, y, 3627, true))
					vsp = random_range(-7, -11);
			}
		}
	}
}
