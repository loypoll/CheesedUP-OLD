with (other)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (!isgustavo && state != 16 && state != states.ghostpossess && state != 146 && state != 147 && state != states.gotoplayer)
	{
		scr_losepoints();
		create_transformation_tip(lang_get_value("ghosttip"), "ghost");
		fmod_event_one_shot("event:/sfx/pep/ghostintro");
		grav /= 2;
		state = 16;
		movespeed = hsp;
		ghostdash = false;
		ghostpepper = 0;
		ghosttimer = 0;
		sprite_index = spr_ghostidle;
		with (instance_create(x, y, obj_sausageman_dead))
		{
			hsp = other.image_xscale * 3;
			image_xscale = -other.image_xscale;
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			paletteselect = other.paletteselect;
			oldpalettetexture = global.palettetexture;
		}
		other.debris = false;
	}
}
