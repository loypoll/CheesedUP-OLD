event_inherited();
active = true;
func = function()
{
	with (obj_soundtest)
	{
		other.active = false;
		other.alarm[1] = 10;
		music_pos++;
		if (music_pos > (array_length(music_arr) - 1))
			music_pos = 0;
		fmod_event_instance_stop(music_event, true);
		sound_destroy_instance(music_event);
		music_event = sound_create_instance(music_arr[music_pos][0]);
		if (play)
			fmod_event_instance_play(music_event);
	}
};
