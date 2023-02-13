if (other.id != baddieID && other.state != 5 && other.state != states.stun)
{
	with (other)
	{
		stunstate = 1;
		stuntimer = stunmax;
		stunned = 0;
		state = 5;
		vsp = -6;
		stunstate = 1;
	}
}
