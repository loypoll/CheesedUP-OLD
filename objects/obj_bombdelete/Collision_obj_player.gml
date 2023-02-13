if (!collide)
{
	if (other.state == states.handstandjump || other.state == 43)
	{
		other.state = 183;
		collide = true;
	}
}
