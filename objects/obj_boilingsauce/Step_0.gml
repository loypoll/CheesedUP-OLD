if (room == rm_editor)
	exit;
var playerid = instance_place(x, y - 1, obj_player);
with (playerid)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (state != 3 && state != 89 && state != 31 && state != 186)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		if (state != 9)
			notification_push(notifs.boilingsauce, [room]);
		state = 9;
		vsp = -20;
		fireasslock = false;
		sprite_index = spr_fireass;
		image_index = 0;
		movespeed = hsp;
		fmod_event_one_shot_3d("event:/sfx/pep/burn", x, y);
		if (!fmod_event_instance_is_playing(global.snd_fireass))
			fmod_event_instance_play(global.snd_fireass);
	}
}
