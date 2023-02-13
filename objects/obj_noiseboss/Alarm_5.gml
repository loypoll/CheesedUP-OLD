flash = true;
if (state != states.boss_fightball && state != states.boss_phase1hurt && state != states.boss_finale && !ballooncrash && !instance_exists(obj_noiseballooncrash))
	fmod_event_one_shot_3d("event:/sfx/misc/bossvulnerable", x, y);
