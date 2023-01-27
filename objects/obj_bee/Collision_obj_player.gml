if (state != 257 && other.state != 257)
{
	with (other)
	{
		state = 257;
		bee_buffer = 150;
	}
	state = 257;
	substate = 257;
	bee_buffer = other.bee_buffer;
	playerid = other.id;
}
