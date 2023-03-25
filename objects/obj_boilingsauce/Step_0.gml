if (room == rm_editor)
	exit;
var playerid = instance_place(x, y - 1, obj_player);
with (playerid)
{
	if (character == "V")
		scr_hurtplayer(id);
	else if (state != states.boots && state != states.dead && state != states.rideweenie && state != states.gotoplayer)
	{
		var _pindex = (object_index == obj_player1) ? 0 : 1;
		GamepadSetVibration(_pindex, 1, 1, 0.85);
		if (state != states.fireass)
			notification_push(notifs.boilingsauce, [room]);
		state = states.fireass;
		vsp = -20;
		fireasslock = false;
		sprite_index = spr_fireass;
		image_index = 0;
		movespeed = hsp;
		sound_play_3d("event:/sfx/pep/burn", x, y);
		if (!sound_is_playing(global.snd_fireass))
			sound_play(global.snd_fireass);
	}
}
