with (other)
{
	if (state != 3 && state != 89 && state != 31 && state != states.gotoplayer && state != 84)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		if (state != 9)
		{
			
		}
		hurted = false;
		state = 9;
		vsp = -25;
		fireasslock = true;
		sprite_index = spr_fireass;
		image_index = 0;
		hsp = 0;
		movespeed = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/burn", x, y);
		if (!fmod_event_instance_is_playing(global.snd_fireass))
			fmod_event_instance_play(global.snd_fireass);
		instance_destroy(other);
	}
}
