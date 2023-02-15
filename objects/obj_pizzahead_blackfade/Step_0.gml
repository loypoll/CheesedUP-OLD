with (obj_player1)
{
	if (state == states.actor || (state == 262 && supergrabstate != 6))
		other.fade = Approach(other.fade, 0.6, 0.1);
	else
		other.fade = Approach(other.fade, 0, 0.05);
}
