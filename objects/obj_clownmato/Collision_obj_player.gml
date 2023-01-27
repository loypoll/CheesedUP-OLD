with (other)
{
	if ((!instakillmove || state == 104) && state != 225 && state != 106 && other.state == 134 && state != 61)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		vsp = -4;
		hsp = -3 * xscale;
		state = 106;
		sprite_index = spr_bump;
		image_index = 0;
		other.state = 106;
		other.sprite_index = spr_clownmato_bounce;
		other.image_index = 0;
	}
}
