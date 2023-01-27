with (other)
{
	if (character == "V")
		scr_hurtplayer(object_index);
	else if (scr_transformationcheck())
	{
		if (state != 10 && state != 147 && hurted == 0)
		{
			fmod_event_one_shot_3d("event:/sfx/firemouth/start", x, y);
			create_transformation_tip(lang_get_value("firemouthtip"), "firemouth");
			firemouthflames = false;
			is_firing = false;
			hsp = 0;
			movespeed = 0;
			state = 10;
			image_index = 0;
			sprite_index = spr_firemouthintro;
			state = 10;
			bombpeptimer = 3;
			instance_destroy(other);
		}
	}
}
