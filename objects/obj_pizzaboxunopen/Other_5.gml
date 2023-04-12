if (snd != -4)
{
	fmod_event_instance_stop(snd, true);
	sound_destroy_instance(snd);
}
