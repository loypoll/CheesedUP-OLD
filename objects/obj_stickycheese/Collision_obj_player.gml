with (other)
{
	if (vsp < 0)
	{
		repeat (2)
			create_debris(x, y + 43, 4075);
		vsp *= 0.5;
		scr_fmod_soundeffect(global.snd_cheesejump, x, y);
	}
	if (state == 37)
		state = grounded ? 0 : 92;
	if (hsp != 0 && (floor(image_index) % 4) == 0)
	{
		create_debris(x, y + 43, 4075);
		if (!other.stepped)
		{
			fmod_event_one_shot_3d("event:/sfx/pep/cheesefloor", x, y);
			other.stepped = true;
			other.alarm[0] = 8;
		}
	}
}
