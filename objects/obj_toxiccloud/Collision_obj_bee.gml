if (other.inv_timer <= 0 && (other.state == 0 || other.state == states.idle || other.state == 141))
{
	with (other)
	{
		inv_timer = 120;
		state = 107;
		hitX = x;
		hitY = y;
		hp--;
		if (hp <= 0)
			instance_destroy();
	}
	disappear = true;
}
