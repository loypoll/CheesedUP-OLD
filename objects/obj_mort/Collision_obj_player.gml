if (sprite_index != spr_mortspawn)
{
	with (other)
	{
		if (state != 11 && state != 12 && state != 13 && state != 14 && state != 190)
		{
			repeat (6)
				create_debris(x, y, spr_feather);
			mort = true;
			instance_create_unique(x, y, obj_mortfollow);
			movespeed = hsp;
			state = 11;
			fmod_event_one_shot_3d("event:/sfx/mort/mortpickup", x, y);
			create_transformation_tip(lang_get_value("morttip"), "morttip");
			instance_destroy(other);
		}
	}
}
