with (other)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (state != states.mach3 && (state != states.chainsaw or tauntstoredstate != states.mach3) && state != states.boots && state != states.dead && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		hurted = false;
		state = states.fireass;
		vsp = -25;
		fireasslock = true;
		sprite_index = spr_fireass;
		image_index = 0;
		hsp = 0;
		movespeed = 0;
		sound_play_3d("event:/sfx/pep/burn", x, y);
		if (!sound_is_playing(global.snd_fireass))
			sound_play(global.snd_fireass);
	}
}
