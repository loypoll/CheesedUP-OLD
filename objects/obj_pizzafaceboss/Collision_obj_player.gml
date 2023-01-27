if (state == 230 && substate == 230)
{
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
}
else if ((other.instakillmove || other.state == 42) && state == 138 && savedthrown == thrown && !savedthrown && elitehit == 1)
	scr_boss_do_hurt_phase2(other.id);
