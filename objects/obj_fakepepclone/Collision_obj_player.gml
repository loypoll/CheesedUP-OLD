if ((state == states.freefall && sprite_index != spr_fakepeppino_bodyslamland) or (state == states.mach2 && attackspeed >= 50) or state == states.Sjump or (state == states.throwing && sprite_index == spr_fakepeppino_flailing))
{
	if other.flash
		flash = 0
	scr_hurtplayer(other)
}
