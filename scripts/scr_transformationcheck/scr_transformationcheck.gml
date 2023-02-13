function scr_transformationcheck()
{
	if (state != 146 && state != states.tube)
	{
		for (var i = 0; i < array_length(transformation); i++)
		{
			if (state == transformation[i])
				return false;
		}
	}
	return true;
}
