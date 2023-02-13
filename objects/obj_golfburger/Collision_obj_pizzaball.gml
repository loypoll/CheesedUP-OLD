if (golfcooldown <= 0 && state != 74 && state != states.stun && state != states.grabbed && other.state != 148 && other.state != states.grabbed && other.bigcheeseID == -4)
{
	golfid = other.id;
	shot = false;
	state = 74;
	sprite_index = spr_golfburger_golf;
	image_index = 0;
	other.bigcheeseID = id;
	if (shootdir == 0)
		image_xscale = choose(-1, 1);
	else
		image_xscale = shootdir;
}
