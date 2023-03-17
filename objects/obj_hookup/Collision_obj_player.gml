with (other)
{
	if (other.appear == -1 && key_up && ladderbuffer == 0 && (state == states.fireass or state == states.punch or state == states.normal or state == states.pogo or state == states.mach2 or state == states.mach3 or state == states.mach1 or state == states.shotgunjump or state == states.jump or state == states.highjump) && state != states.hurt && state != states.machslide && state != states.freefall && state != states.freefallland)
	{
		fmod_event_instance_play(other.snd);
		other.hooked = true;
		hooked = true;
		mach2 = 0;
		state = states.ladder;
		x = other.x + 16;
		y = other.y + 40;
	}
}
