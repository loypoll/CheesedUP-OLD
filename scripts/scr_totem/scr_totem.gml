function totem_empty()
{
	with (argument0)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] == -4)
				return true;
		}
		return false;
	}
}
function totem_add()
{
	with (argument0)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] == -4)
			{
				cheeseID[i] = argument1;
				return true;
			}
		}
		return false;
	}
}
function totem_clear()
{
	with (argument0)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] != -4 && (!instance_exists(cheeseID[i]) || cheeseID[i].state != states.totem))
			{
				if (instance_exists(cheeseID[i]))
					cheeseID[i].totemID = -4;
				cheeseID[i] = -4;
			}
		}
	}
}
function totem_count()
{
	var c = 0;
	with (argument0)
	{
		for (var i = 0; i < array_length(cheeseID); i++)
		{
			if (cheeseID[i] != -4)
				c++;
		}
		return c;
	}
}
