if (patroltimer > 0)
{
	patroltimer--;
	alarm[5] = 60;
}
else
{
	scr_fmod_soundeffect(global.snd_alarm, x, y);
	patrolfound = false;
	state = 80;
	sprite_index = spr_teeth_alert;
	image_index = 0;
	scr_monster_activate();
}
