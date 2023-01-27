function scr_transformationcheck()
{
	if (state != 146 && state != 150)
	{
		for (var i = 0; i < array_length(transformation); i++)
		{
			if (state == transformation[i])
				return false;
		}
	}
	return true;
}
