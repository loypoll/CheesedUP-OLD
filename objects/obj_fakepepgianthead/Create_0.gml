with (obj_bosscontroller)
	persistent = false;
depth = -6;
image_speed = 0.35;
alarm[0] = 10;
state = 0;
snd = fmod_event_create_instance("event:/sfx/fakepep/chase");
fmod_event_instance_play(snd);
