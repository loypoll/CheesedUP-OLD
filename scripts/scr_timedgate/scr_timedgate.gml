function scr_timedgate_object()
{
	if (timedgate)
	{
		if (ds_list_find_index(argument0, id) == -1)
			ds_list_add(argument0, id);
		with (instance_create(x, y, obj_timedgatespawn))
		{
			content = other.object_index;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		instance_destroy();
	}
}
function timedgate_trigger()
{
	with (obj_timedgatespawn)
	{
		if (!instance_exists(contentID))
		{
			with (instance_create(x, y, content))
			{
				other.contentID = id;
				important = true;
				image_xscale = other.image_xscale;
				image_yscale = other.image_yscale;
				create_particle(x, y, 1, 0);
			}
		}
	}
}
function timedgate_add_objects()
{
	with (argument0)
	{
		if (!variable_instance_exists(id, "timedgate"))
			timedgate = false;
		scr_timedgate_object(argument1);
	}
}
