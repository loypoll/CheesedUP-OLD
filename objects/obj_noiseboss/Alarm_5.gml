flash = true;
if (state != 295 && state != 273 && state != 289 && !ballooncrash && !instance_exists(obj_noiseballooncrash))
	fmod_event_one_shot_3d("event:/sfx/misc/bossvulnerable", x, y);
