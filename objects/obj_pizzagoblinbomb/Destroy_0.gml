if (destroy)
{
	trace("self: ", baddie);
	with (instance_create(x, y, obj_canonexplosion))
	{
		rat = other.grabbable;
		baddie = other.baddie;
		trace("canonexplosion create: ", baddie);
	}
}
fmod_event_instance_stop(snd, true);
sound_destroy_instance(snd);
