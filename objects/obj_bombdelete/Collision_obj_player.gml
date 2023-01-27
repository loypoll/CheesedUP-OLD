if (!collide)
{
	if (other.state == 42 || other.state == 43)
	{
		other.state = 183;
		collide = true;
	}
}
