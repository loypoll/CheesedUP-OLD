if (state == states.freefall or (state == states.mach2 && attackspeed >= 18) or state == states.Sjump or (state == states.throwing && attackspeed > 0))
{
	if (other.flash)
		flash = false;
	scr_hurtplayer(other);
}
