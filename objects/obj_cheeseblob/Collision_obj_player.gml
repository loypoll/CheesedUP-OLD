if (other.state != 61)
{
	repeat (8)
	{
		with (create_debris(x, y, 1517))
		{
			vsp = random_range(-5, 0);
			hsp = random_range(-3, 3);
		}
	}
	if (other.state != 24)
	{
	}
	other.state = 24;
	other.movespeed = 0;
	other.sprite_index = other.spr_cheesepepintro;
	instance_destroy();
}
