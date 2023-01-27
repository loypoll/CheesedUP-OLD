if (state != 4 && (other.state != 42 || invincible) && (other.state != 5 || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && state != 138 && (state == 141 || state == 134))
{
	var s = other.state;
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
	if (other.state != s && other.state != 147)
	{
		state = 138;
		hsp = -image_xscale * 7;
		vsp = -6;
		stunned = 100;
	}
}
