if (state == 138 && thrown && other.state != 5 && other.state != 138)
{
	with (other)
	{
		state = 138;
		vsp = -5;
		stunstate = 0;
		stunned = 100;
	}
}
