if (!grabbed && (other.state == states.handstandjump || other.state == 80 || other.state == 43) && unpickable == 0)
{
	instance_create(x + (obj_player1.xscale * 40), y, obj_punchdust);
	with (other)
	{
		image_index = 0;
		sprite_index = spr_haulingstart;
		baddiegrabbedID = other.id;
		grabbingenemy = true;
		state = states.grab;
	}
	playerid = other.object_index;
	grabbed = true;
}
if (!grabbed && unpickable == 0 && !ratgrabbed && other.state == 193)
{
	ratplayerid = other.id;
	ratgrabbed = true;
	state = 205;
	other.ratgrabbedID = id;
	other.state = 191;
}
