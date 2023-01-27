if (state == 102)
{
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
}
else if ((state == 269 || (state == 138 && savedthrown == thrown && !savedthrown)) && wastedhits == 4 && phase == 1 && (other.instakillmove || other.state == 42))
	scr_vigilante_do_hurt_phase2(other);
