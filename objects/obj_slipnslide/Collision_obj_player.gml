with (other)
{
	if (state != 211 && state != 210 && state != states.cheeseball)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		other.drop = true;
		vsp = -11;
		movespeed += 2;
		if (movespeed > 14)
			movespeed = 14;
		hsp = movespeed * xscale;
		image_index = 0;
		state = 165;
	}
	instance_destroy(other);
}
