if (room == rm_editor)
	exit;
if (global.key_inv)
	exit;
with (other)
{
	if (state != 51 && state != 186 && state != 16 && state != 47 && state != 21 && state != 33 && state != 24 && state != 48 && state != 38 && state != 107 && state != 49)
	{
		instance_destroy(other);
		global.key_inv = true;
		key_particles = true;
		alarm[7] = 30;
		fmod_event_one_shot("event:/sfx/misc/collecttoppin");
		state = 90;
		image_index = 0;
		keysound = false;
		global.combotime = 60;
	}
}
