function add_achievement_update()
{
	var q = 
	{
		name: argument0,
		update_rate: argument1,
		frames: 0,
		update_func: -4,
		creation_code: -4,
		variables: ds_map_create(),
		unlocked: false
	};
	q.update_func = method(q, argument3);
	if (argument2 != -4)
	{
		q.creation_code = method(q, argument2);
		q.creation_code();
	}
	array_push(obj_achievementtracker.achievements_update, q);
	return q;
}
function add_achievement_notify()
{
	if (argument3 == undefined)
		argument3 = true;
	if (argument4 == undefined)
		argument4 = -4;
	if (argument5 == undefined)
		argument5 = -4;
	var q = 
	{
		name: argument0,
		creation_code: -4,
		func: -4,
		unlocked: false,
		variables: ds_map_create()
	};
	q.func = method(q, argument2);
	if (argument1 != -4)
	{
		q.creation_code = method(q, argument1);
		q.creation_code();
	}
	if (argument3 == 0)
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		if (ini_read_real(argument4, argument5, false) == 1)
		{
			trace(argument5, " already unlocked");
			q.unlocked = true;
			ini_close();
			exit;
		}
		ini_close();
	}
	array_push(obj_achievementtracker.achievements_notify, q);
	return q;
}
function notification_push()
{
	trace("Pushing notification: ", argument0, " ", argument1);
	with (obj_achievementtracker)
		ds_queue_enqueue(notify_queue, [argument0, argument1]);
}
function achievement_add_variable()
{
	if (argument2 == undefined)
		argument2 = false;
	if (argument3 == undefined)
		argument3 = false;
	var q = 
	{
		init_value: argument1,
		value: argument1,
		save: argument2,
		resettable: argument3
	};
	ds_map_add(variables, argument0, q);
	return q;
}
function achievement_get_variable()
{
	return ds_map_find_value(variables, argument0);
}
function achievement_unlock()
{
	if (argument3 == undefined)
		argument3 = 0;
	var b = achievement_get_struct(argument0);
	with (b)
	{
		if (!unlocked)
		{
			trace("Achievement unlocked! ", argument0, " ", argument1);
			unlocked = true;
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("achievements", name, true);
			obj_savesystem.ini_str = ini_close();
			notification_push(51, [name]);
			obj_achievementtracker.alarm[0] = 2;
			ds_queue_enqueue(obj_achievementtracker.unlock_queue, [argument2, argument3]);
		}
	}
	if (global.steam_api)
	{
		var steamach = ds_map_find_value(global.steam_achievements, argument0);
		if (!is_undefined(steamach))
		{
			trace("Steam achievement unlocked! ", steamach);
			if (!steam_get_achievement(steamach))
				steam_set_achievement(steamach);
		}
		else
			trace("Could not find steam achievement! ", argument0);
	}
	else
		trace("Steam API not initialized!");
	with (obj_achievementviewer)
		event_perform(7, 4);
}
function palette_unlock()
{
	if (argument3 == undefined)
		argument3 = -4;
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("Palettes", argument1, true);
	obj_savesystem.ini_str_options = ini_close();
	gamesave_async_save_options();
	var b = achievement_get_struct(argument0);
	with (b)
	{
		if (!unlocked)
			unlocked = true;
	}
	with (instance_create(0, 0, obj_cheftask))
	{
		achievement_spr = -4;
		sprite_index = spr_newclothes;
		paletteselect = argument2;
		texture = argument3;
	}
}
function achievement_reset_variables()
{
	for (var i = 0; i < array_length(argument0); i++)
	{
		var b = argument0[i];
		with (b)
		{
			var size = ds_map_size(variables);
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if (q.resettable)
					q.value = q.init_value;
				key = ds_map_find_next(variables, key);
			}
		}
	}
}
function achievement_save_variables()
{
	for (var i = 0; i < array_length(argument0); i++)
	{
		var b = argument0[i];
		ini_open_from_string(obj_savesystem.ini_str);
		with (b)
		{
			var size = ds_map_size(variables);
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if (q.save)
					ini_write_real("achievements_variables", key, q.value);
				key = ds_map_find_next(variables, key);
			}
		}
		obj_savesystem.ini_str = ini_close();
	}
}
function achievements_load()
{
	for (var i = 0; i < array_length(argument0); i++)
	{
		var b = argument0[i];
		with (b)
		{
			unlocked = ini_read_real("achievements", name, false);
			var size = ds_map_size(variables);
			for (var j = 0; j < size; j++)
			{
				var q = ds_map_find_value(variables, key);
				if (q.save)
					q.value = ini_read_real("achievements_variables", key, q.init_value);
				key = ds_map_find_next(variables, key);
			}
		}
	}
}
function achievement_get_struct()
{
	var l = obj_achievementtracker.achievements_update;
	var b = -4;
	for (var i = 0; i < array_length(l); i++)
	{
		var q = l[i];
		if (q.name == argument0)
		{
			b = q;
			break;
		}
	}
	if (b == -4)
	{
		l = obj_achievementtracker.achievements_notify;
		for (i = 0; i < array_length(l); i++)
		{
			q = l[i];
			if (q.name == argument0)
			{
				b = q;
				break;
			}
		}
	}
	return b;
}
