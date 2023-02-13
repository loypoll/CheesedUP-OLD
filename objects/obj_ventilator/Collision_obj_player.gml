with (other)
{
	if (vsp > -5)
		vsp = Approach(vsp, -5, 5);
	if (state == states.jump)
		sprite_index = spr_machfreefall;
	jumpstop = true;
	if ((state == states.machslide || state == 108) || (state == 5 && sprite_index != spr_dive))
	{
		state = 92;
		movespeed = 0;
		vsp = -5;
		grounded = false;
		if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
			xscale *= -1;
		sprite_index = spr_machfreefall;
	}
	if (!fmod_event_instance_is_playing(global.snd_ventilator))
		scr_fmod_soundeffect(global.snd_ventilator, x, y);
	else
		fmod_event_instance_set_3d_attributes(global.snd_ventilator, x, y);
}
