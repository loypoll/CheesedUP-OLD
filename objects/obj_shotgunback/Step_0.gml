with (obj_player1)
{
	if (shotgunAnim == 1)
	{
		if (state != 0 && state != 100 && state != 71 && state != 111 && state != states.jump && state != states.handstandjump)
			other.visible = true;
		else
			other.visible = false;
	}
	other.x = x - (20 * xscale);
	other.y = y;
	other.image_xscale = -xscale;
}
if (room == rank_room)
	visible = false;
