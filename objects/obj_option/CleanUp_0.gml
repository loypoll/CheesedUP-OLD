for (var j = 0; j < array_length(menus); j++)
{
	for (var i = 0; i < array_length(m.options); i++)
	{
		var b = m.options[i];
		if (b.type == 3)
		{
			if (b.sound != -4)
			{
				fmod_event_instance_stop(b.sound, true);
				fmod_event_instance_release(b.sound);
			}
		}
	}
}
