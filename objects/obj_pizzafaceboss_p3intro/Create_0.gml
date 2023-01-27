hsp = 0;
vsp = 0;
hsp_carry = 0;
vsp_carry = 0;
grav = 0.5;
platformid = -4;
image_speed = 0.35;
introstate = 0;
introbuffer = 0;
peppermanid = -4;
prop = 0;
proparr = [[1277, 4056, 3413, -7], [3061, 3073, 965, -6], [1325, 1239, 965, -5], [3894, 1582, 965, -4]];
with (obj_music)
	fmod_event_instance_set_parameter(music.event, "state", 2, false);
if (room == rm_testing4)
{
	with (obj_player)
		state = 146;
}
instance_destroy(obj_superattackeffect);
instance_destroy(obj_blackoutline);
warbg_stop();
steppysnd = false;
snd_spin = fmod_event_create_instance("event:/sfx/pizzahead/spin");
snd_laugh = fmod_event_create_instance("event:/sfx/voice/pizzahead");
