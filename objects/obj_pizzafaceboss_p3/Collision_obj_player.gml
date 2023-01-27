if (state == 108 || (state == 104 && attackspeed >= 18) || state == 97 || (state == 74 && attackspeed > 0))
{
	if (other.flash)
		flash = false;
	scr_hurtplayer(other);
}
