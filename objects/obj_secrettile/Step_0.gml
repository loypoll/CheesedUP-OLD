if buffer > 0
	buffer--;

var player = instance_place(x, y, obj_player);
if (player && player.state != states.chainsaw) or active
{
	if !revealed
	{
		if buffer > 0
			image_alpha = 0;
		revealed = true;
		ds_list_add(global.saveroom, id);
		
		if REMIX && buffer <= 0
		{
			sound_stop(sfx_collectpizza);
			sound_play("event:/sfx/pto/secretwall");
		}
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
