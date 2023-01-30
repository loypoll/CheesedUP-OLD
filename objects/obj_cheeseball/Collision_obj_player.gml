if (other.state != 186 && other.state != 61)
{
	if (other.state == 47 || other.state == 38 || other.state == 21)
	{
		repeat (8)
		{
			with (create_debris(x, y, spr_slimedebris))
			{
				vsp = random_range(-5, 0);
				hsp = random_range(-3, 3);
			}
		}
		instance_destroy();
	}
	else
	{
		other.xscale = image_xscale;
		other.hsp = hsp;
		other.vsp = vsp;
		other.movespeed = 8;
		other.x = x;
		other.y = y;
		other.state = 21;
		other.stop_buffer = other.stop_max;
		repeat (8)
		{
			with (create_debris(x, y, spr_slimedebris))
			{
				vsp = random_range(-5, 0);
				hsp = random_range(-3, 3);
			}
		}
		instance_destroy();
	}
}
