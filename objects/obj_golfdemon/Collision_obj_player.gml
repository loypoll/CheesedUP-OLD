if (state != states.grabbed && (other.state != states.handstandjump || invincible) && (other.state != 5 || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && state != states.stun && (state == 141 || state == states.walk))
{
	var s = other.state;
	if (other.flash)
		other.flash = false;
	scr_hurtplayer(other);
	if (other.state != s && other.state != 147)
	{
		state = states.stun;
		hsp = -image_xscale * 7;
		vsp = -6;
		stunned = 100;
	}
}
