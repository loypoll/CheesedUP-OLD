with (obj_player)
{
	if (state == 146)
		state = 0;
}
gamesave_async_save_options();
fmod_event_instance_stop(global.snd_slidermaster, true);
fmod_event_instance_stop(global.snd_slidermusic, true);
fmod_event_instance_stop(global.snd_slidersfx, true);
