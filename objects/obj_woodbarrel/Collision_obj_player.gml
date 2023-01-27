if ((other.state == 42 || other.state == 80) && other.grounded == 1)
{
	instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
	with (other)
	{
		image_index = 0;
		sprite_index = spr_haulingstart;
		grabbingenemy = true;
		baddiegrabbedID = other.id;
		state = 79;
	}
	playerid = other.object_index;
	grabbed = true;
}
if (other.state == 104 || other.state == 121 || (other.state == 65 && grounded))
{
	create_particle(x, y, 9, 0);
	with (other)
	{
		vsp = 0;
		mask_index = spr_crouchmask;
		x = other.x;
		y = other.y;
		state = 113;
		sprite_index = spr_barrelroll;
		movespeed = 12;
	}
	instance_destroy();
}
