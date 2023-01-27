with (other)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (state != 121 && (state != 61 || tauntstoredstate != 121) && state != 3 && state != 89 && state != 31 && state != 186)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		state = 9;
		vsp = -25;
		sprite_index = spr_fireass;
		image_index = 0;
		if (!fmod_event_instance_is_playing(global.snd_fireass))
			fmod_event_instance_play(global.snd_fireass);
	}
}
