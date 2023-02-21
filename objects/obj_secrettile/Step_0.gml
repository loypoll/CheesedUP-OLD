var player = instance_place(x, y, obj_player);
active = player;

if active
{
	with obj_secrettile
	{
		if distance_to_object(other) <= 0
			active = true;
	}
	
	depth = -8;
	if depth < desireddepth
		depth = desireddepth;
	alpha = Approach(alpha, 0, 0.05);
}
else
{
	depth = desireddepth;
	alpha = Approach(alpha, 1, 0.05);
}
