scr_sound_multiple("event:/sfx/misc/breakblock", x, y);
create_debris(x, y, 1508);
create_debris(x, y, 1506);
if (playerid != -4)
{
	with (playerid)
	{
		xscale = other.image_xscale;
		sprite_index = spr_player_skateboard;
		state = 106;
		sprite_index = spr_bump;
		hsp = -xscale * 4;
		vsp = -5;
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
	}
}
fmod_event_instance_stop(snd, true);
fmod_event_instance_release(snd);
