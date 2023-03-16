with (other)
{
	if (state == states.handstandjump or state == states.lungeattack or state == states.punch)
	{
		image_index = 0;
		sprite_index = spr_shotgunpullout;
		sound_play_3d("event:/sfx/pep/shotgunload", x, y);
		sound_play_3d("event:/sfx/misc/breakblock", x, y);
		instance_destroy(other);
		shotgunAnim = true;
		state = states.shotgun;
		create_transformation_tip(lang_get_value("shotguntip"), "shotgun");
		if (room == war_1)
		{
			with (instance_create_unique(0, 0, obj_wartimer))
			{
				minutes = 0;
				seconds = 40;
			}
			with (obj_escapecollect)
				image_alpha = 1;
			with (obj_music)
				fmod_event_instance_play(music.event);
		}
		global.heattime = 60;
	}
}
