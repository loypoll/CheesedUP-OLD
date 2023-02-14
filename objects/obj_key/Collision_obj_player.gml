if (room == rm_editor)
	exit;
if (global.key_inv)
	exit;
with (other)
{
	if (state != 51 && state != states.gotoplayer && state != states.ghost && state != 47 && state != states.cheeseball && state != states.boxxedpep && state != states.cheesepep && state != 48 && state != states.knightpepslopes && state != states.hurt && state != states.knightpepbump)
	{
		instance_destroy(other);
		global.key_inv = true;
		key_particles = true;
		alarm[7] = 30;
		fmod_event_one_shot("event:/sfx/misc/collecttoppin");
		state = states.keyget;
		image_index = 0;
		keysound = false;
		global.combotime = 60;
	}
}
