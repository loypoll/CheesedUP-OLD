if (state != states.bee && other.state != states.bee)
{
	with (other)
	{
		state = states.bee;
		bee_buffer = 150;
	}
	state = states.bee;
	substate = 257;
	bee_buffer = other.bee_buffer;
	playerid = other.id;
}
