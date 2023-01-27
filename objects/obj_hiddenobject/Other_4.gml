if (ds_list_find_index(global.saveroom, id) == -1)
{
	var objectlist = ds_list_create();
	ds_list_add(objectlist, 622, 752, 763);
	var instancelist = ds_list_create();
	for (var i = 0; i < ds_list_size(objectlist); i++)
	{
		var obj = ds_list_find_value(objectlist, i);
		for (var j = 0; j < l; j++)
		{
			var _currentobj = ds_list_find_value(instancelist, j);
			if (ds_list_find_index(deactivatedlist, _currentobj.id) == -1)
			{
				ds_list_add(deactivatedlist, _currentobj.id);
				switch (obj)
				{
					case 622:
						if (_currentobj.boundbox)
							boundbox = false;
						if (_currentobj.hitboxcreate)
							hitboxcreate = false;
						break;
				}
				instance_deactivate_object(_currentobj.id);
			}
		}
		ds_list_clear(instancelist);
	}
	ds_list_destroy(objectlist);
	ds_list_destroy(instancelist);
}
else
	activated = true;
