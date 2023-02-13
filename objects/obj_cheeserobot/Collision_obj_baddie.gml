with (other)
{
	if ((other.state == states.stun && other.thrown == 1) || (other.state == 4 && obj_player.state == 76))
		instance_destroy();
}
