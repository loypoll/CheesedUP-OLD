var player = instance_place(x, y, obj_player);
if player or active
{
	with obj_secrettile
	{
		if distance_to_object(other) <= 0
			active = true;
	}
	
	depth = -8;
	if depth < desireddepth
		depth = desireddepth;
	image_alpha = Approach(image_alpha, 0, 0.05);
}
else
{
	depth = desireddepth;
	image_alpha = Approach(image_alpha, 1, 0.05);
}
active = false;
