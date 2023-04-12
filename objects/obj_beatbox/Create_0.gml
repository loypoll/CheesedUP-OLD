scr_initenemy();
vsp = -11;
depth = -3;
snd = sound_create_instance("event:/sfx/misc/breakdancemusic");
fmod_event_instance_set_3d_attributes(snd, x, y);
fmod_event_instance_play(snd);
sound_play_3d("event:/sfx/misc/breakdance", obj_player1.x, obj_player1.y);
