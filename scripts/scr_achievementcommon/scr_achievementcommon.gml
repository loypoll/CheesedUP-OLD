function add_secrets_achievement()
{
	var b = add_achievement_notify(concat("secrets", argument0), -4, function()
	{
		var type = argument0[0];
		if (type == 5)
		{
			var n = levelarray;
			var _unfinished = false;
			ini_open_from_string(obj_savesystem.ini_str);
			for (var i = 0; i < array_length(n); i++)
			{
				var b = n[i];
				var s = ini_read_real("Secret", b, 0);
				if (s < 3)
					_unfinished = true;
			}
			ini_close();
			if (!_unfinished)
				achievement_unlock(name, -4, 3078, 0);
		}
	});
	b.levelarray = argument1;
}
function add_rank_achievements(argument0, argument1, argument2, argument3, argument4)
{
	var b = add_achievement_notify(concat(argument1, "ranks", argument0), -4, function(argument0)
	{
		var type = argument0[0];
		if (type == 5)
		{
			var n = levelarray;
			var _finished = true;
			ini_open_from_string(obj_savesystem.ini_str);
			var map = ds_map_create();
			ds_map_set(map, "d", 0);
			ds_map_set(map, "c", 1);
			ds_map_set(map, "b", 2);
			ds_map_set(map, "a", 3);
			ds_map_set(map, "s", 4);
			ds_map_set(map, "p", 5);
			for (var i = 0; i < array_length(n); i++)
			{
				var b = n[i];
				var s = ini_read_string("Ranks", b, "d");
				if (ds_map_find_value(map, s) < ds_map_find_value(map, rank))
					_finished = false;
			}
			ds_map_destroy(map);
			ini_close();
			if (_finished)
				achievement_unlock(name, "", sprite, index);
		}
	});
	b.rank = argument1;
	b.levelarray = argument4;
	b.sprite = argument2;
	b.index = argument3;
}
function add_boss_achievements(argument0, argument1, argument2, argument3)
{
	var b = add_achievement_notify(argument0, -4, function(argument0)
	{
		var type = argument0[0];
		var arr = argument0[1];
		if (type == 49 && arr[0] == bossroom && !global.bossplayerhurt)
			achievement_unlock(name, "", sprite, index);
	});
	b.sprite = argument2;
	b.index = argument3;
	b.bossroom = argument1;
}
function scr_custom_notification_destructibles()
{
	active = false;
	step = function()
	{
		if (!active)
		{
			if (!place_meeting(x, y, obj_destructibles))
			{
				active = true;
				notification_push(15, [room]);
			}
		}
	};
}
