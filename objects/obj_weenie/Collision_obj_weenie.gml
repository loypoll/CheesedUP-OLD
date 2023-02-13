if (state == states.stun && thrown && other.state != 5 && other.state != states.stun)
{
	with (other)
	{
		state = states.stun;
		vsp = -5;
		stunstate = 0;
		stunned = 100;
	}
}
