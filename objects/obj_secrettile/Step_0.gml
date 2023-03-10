var player = instance_place(x, y, obj_player);
if player or active
{
	if !revealed
	{
		revealed = true;
		ds_list_add(global.saveroom, id);
		
		sound_stop(sfx_collectpizza);
		if REMIX
			sound_play("event:/sfx/pto/secretwall");
	}
	
	with obj_secrettile
	{
		if distance_to_object(other) <= 1
		{
			if !revealed
			{
				revealed = true;
				ds_list_add(global.saveroom, id);
			}
			active = true;
		}
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
