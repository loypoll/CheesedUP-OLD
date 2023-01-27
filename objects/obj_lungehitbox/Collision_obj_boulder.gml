if (other.state != 4 && playerid.state != 79)
{
	other.state = 4;
	if (playerid.object_index == obj_player1)
		other.grabbedby = 1;
	else
		other.grabbedby = 2;
	with (playerid)
	{
		state = 79;
		baddiegrabbedID = other.id;
		grabbingenemy = true;
		movespeed = 0;
		image_index = 0;
		sprite_index = spr_haulingstart;
	}
}
