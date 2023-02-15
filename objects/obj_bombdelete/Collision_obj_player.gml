if (!collide)
{
	if (other.state == states.handstandjump || other.state == states.lungeattack)
	{
		other.state = 183;
		collide = true;
	}
}
