if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}

global.steam_achievements = ds_map_create();
ds_map_set(global.steam_achievements, "entrance1", "ACH_ENTRANCE_1");
ds_map_set(global.steam_achievements, "entrance2", "ACH_ENTRANCE_2");
ds_map_set(global.steam_achievements, "entrance3", "ACH_ENTRANCE_3");
ds_map_set(global.steam_achievements, "medieval1", "ACH_MEDIEVAL_1");
ds_map_set(global.steam_achievements, "medieval2", "ACH_MEDIEVAL_2");
ds_map_set(global.steam_achievements, "medieval3", "ACH_MEDIEVAL_3");
ds_map_set(global.steam_achievements, "ruin1", "ACH_RUIN_1");
ds_map_set(global.steam_achievements, "ruin2", "ACH_RUIN_2");
ds_map_set(global.steam_achievements, "ruin3", "ACH_RUIN_3");
ds_map_set(global.steam_achievements, "dungeon1", "ACH_DUNGEON_1");
ds_map_set(global.steam_achievements, "dungeon2", "ACH_DUNGEON_2");
ds_map_set(global.steam_achievements, "dungeon3", "ACH_DUNGEON_3");
ds_map_set(global.steam_achievements, "badland1", "ACH_BADLAND_1");
ds_map_set(global.steam_achievements, "badland2", "ACH_BADLAND_2");
ds_map_set(global.steam_achievements, "badland3", "ACH_BADLAND_3");
ds_map_set(global.steam_achievements, "graveyard1", "ACH_GRAVEYARD_1");
ds_map_set(global.steam_achievements, "graveyard2", "ACH_GRAVEYARD_2");
ds_map_set(global.steam_achievements, "graveyard3", "ACH_GRAVEYARD_3");
ds_map_set(global.steam_achievements, "farm1", "ACH_FARM_1");
ds_map_set(global.steam_achievements, "farm2", "ACH_FARM_2");
ds_map_set(global.steam_achievements, "farm3", "ACH_FARM_3");
ds_map_set(global.steam_achievements, "saloon1", "ACH_SALOON_1");
ds_map_set(global.steam_achievements, "saloon2", "ACH_SALOON_2");
ds_map_set(global.steam_achievements, "saloon3", "ACH_SALOON_3");
ds_map_set(global.steam_achievements, "plage1", "ACH_BEACH_1");
ds_map_set(global.steam_achievements, "plage2", "ACH_BEACH_2");
ds_map_set(global.steam_achievements, "plage3", "ACH_BEACH_3");
ds_map_set(global.steam_achievements, "forest1", "ACH_FOREST_1");
ds_map_set(global.steam_achievements, "forest2", "ACH_FOREST_2");
ds_map_set(global.steam_achievements, "forest3", "ACH_FOREST_3");
ds_map_set(global.steam_achievements, "space1", "ACH_SPACE_1");
ds_map_set(global.steam_achievements, "space2", "ACH_SPACE_2");
ds_map_set(global.steam_achievements, "space3", "ACH_SPACE_3");
ds_map_set(global.steam_achievements, "minigolf1", "ACH_GOLF_1");
ds_map_set(global.steam_achievements, "minigolf2", "ACH_GOLF_2");
ds_map_set(global.steam_achievements, "minigolf3", "ACH_GOLF_3");
ds_map_set(global.steam_achievements, "street1", "ACH_STREET_1");
ds_map_set(global.steam_achievements, "street2", "ACH_STREET_2");
ds_map_set(global.steam_achievements, "street3", "ACH_STREET_3");
ds_map_set(global.steam_achievements, "sewer1", "ACH_SEWER_1");
ds_map_set(global.steam_achievements, "sewer2", "ACH_SEWER_2");
ds_map_set(global.steam_achievements, "sewer3", "ACH_SEWER_3");
ds_map_set(global.steam_achievements, "industrial1", "ACH_INDUSTRIAL_1");
ds_map_set(global.steam_achievements, "industrial2", "ACH_INDUSTRIAL_2");
ds_map_set(global.steam_achievements, "industrial3", "ACH_INDUSTRIAL_3");
ds_map_set(global.steam_achievements, "freezer1", "ACH_FREEZER_1");
ds_map_set(global.steam_achievements, "freezer2", "ACH_FREEZER_2");
ds_map_set(global.steam_achievements, "freezer3", "ACH_FREEZER_3");
ds_map_set(global.steam_achievements, "chateau1", "ACH_CHATEAU_1");
ds_map_set(global.steam_achievements, "chateau2", "ACH_CHATEAU_2");
ds_map_set(global.steam_achievements, "chateau3", "ACH_CHATEAU_3");
ds_map_set(global.steam_achievements, "kidsparty1", "ACH_KIDSPARTY_1");
ds_map_set(global.steam_achievements, "kidsparty2", "ACH_KIDSPARTY_2");
ds_map_set(global.steam_achievements, "kidsparty3", "ACH_KIDSPARTY_3");
ds_map_set(global.steam_achievements, "war1", "ACH_WAR_1");
ds_map_set(global.steam_achievements, "war2", "ACH_WAR_2");
ds_map_set(global.steam_achievements, "war3", "ACH_WAR_3");
ds_map_set(global.steam_achievements, "pepperman", "ACH_BOSS_1");
ds_map_set(global.steam_achievements, "vigilante", "ACH_BOSS_2");
ds_map_set(global.steam_achievements, "noise", "ACH_BOSS_3");
ds_map_set(global.steam_achievements, "fakepep", "ACH_BOSS_4");
ds_map_set(global.steam_achievements, "pizzaface", "ACH_BOSS_5");
ds_map_set(global.steam_achievements, "sranks1", "ACH_SRANK_1");
ds_map_set(global.steam_achievements, "sranks2", "ACH_SRANK_2");
ds_map_set(global.steam_achievements, "sranks3", "ACH_SRANK_3");
ds_map_set(global.steam_achievements, "sranks4", "ACH_SRANK_4");
ds_map_set(global.steam_achievements, "sranks5", "ACH_SRANK_5");
ds_map_set(global.steam_achievements, "pranks1", "ACH_PRANK_1");
ds_map_set(global.steam_achievements, "pranks2", "ACH_PRANK_2");
ds_map_set(global.steam_achievements, "pranks3", "ACH_PRANK_3");
ds_map_set(global.steam_achievements, "pranks4", "ACH_PRANK_4");
ds_map_set(global.steam_achievements, "pranks5", "ACH_PRANK_5");

achievements_update = [];
achievements_notify = [];
notify_queue = ds_queue_create();
unlock_queue = ds_queue_create();

// TODO
add_rank_achievements(1, "s", spr_achievement_srank, 0, ["entrance", "medieval", "ruin", "dungeon"]);
add_rank_achievements(2, "s", spr_achievement_srank, 1, ["badland", "graveyard", "saloon", "farm"]);
add_rank_achievements(3, "s", spr_achievement_srank, 2, ["plage", "forest", "space", "minigolf"]);
add_rank_achievements(4, "s", spr_achievement_srank, 3, ["street", "sewer", "industrial", "freezer"]);
add_rank_achievements(5, "s", spr_achievement_srank, 4, ["chateau", "kidsparty", "war"]);
add_rank_achievements(1, "p", spr_achievement_prank, 0, ["entrance", "medieval", "ruin", "dungeon"]);
add_rank_achievements(2, "p", spr_achievement_prank, 1, ["badland", "graveyard", "saloon", "farm"]);
add_rank_achievements(3, "p", spr_achievement_prank, 2, ["plage", "forest", "space", "minigolf"]);
add_rank_achievements(4, "p", spr_achievement_prank, 3, ["street", "sewer", "industrial", "freezer"]);
add_rank_achievements(5, "p", spr_achievement_prank, 4, ["chateau", "kidsparty", "war"]);

add_boss_achievements("pepperman", boss_pepperman, spr_achievement_bosses, 0);
add_boss_achievements("vigilante", boss_vigilante, spr_achievement_bosses, 1);
add_boss_achievements("noise", boss_noise, spr_achievement_bosses, 2);
add_boss_achievements("fakepep", boss_fakepep, spr_achievement_bosses, 3);
add_boss_achievements("pizzaface", boss_pizzafacehub, spr_achievement_bosses, 4);

add_achievement_notify("pal_unfunny", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 50 && arr[0] >= 75)
		palette_unlock(name, "unfunny", 3);
}, false, "Palettes", "unfunny");

add_achievement_notify("pal_mooney", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 57)
		palette_unlock(name, "mooney", 15);
}, false, "Palettes", "mooney");

add_achievement_notify("pal_sage", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 5)
	{
		var _found = false;
		ini_open_from_string(obj_savesystem.ini_str);
		var lvl = ["entrance", "medieval", "ruin", "dungeon"];
		for (var i = 0; i < array_length(lvl); i++)
		{
			if (ini_read_real("Highscore", lvl[i], 0) == 0)
			{
				_found = true;
				break;
			}
		}
		ini_close();
		if (!_found && global.file_minutes < 60)
			palette_unlock(name, "sage", 5);
	}
}, false, "Palettes", "sage");

add_achievement_notify("pal_money", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 5)
	{
		var _money = 0;
		ini_open_from_string(obj_savesystem.ini_str);
		var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon"];
		for (var i = 0; i < array_length(lvl); i++)
		{
			for (var j = 0; j < 5; j++)
			{
				if (ini_read_real("Toppin", concat(lvl[i], j + 1), false) == 1)
					_money += 10;
			}
		}
		_money -= ini_read_real("w1stick", "reduction", 0);
		_money -= ini_read_real("w2stick", "reduction", 0);
		ini_close();
		if (_money >= 300)
			palette_unlock(name, "money", 4);
	}
}, false, "Palettes", "money");

add_achievement_notify("pal_blood", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 5)
	{
		ini_open_from_string(obj_savesystem.ini_str);
		var _count = ini_read_real("Game", "enemies", 0);
		ini_close();
		if (_count >= 1000)
			palette_unlock(name, "blood", 6);
	}
}, false, "Palettes", "blood");

add_achievement_notify("pal_tv", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 5)
	{
		ini_open_from_string(obj_savesystem.ini_str);
		var _found = false;
		var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
		var map = ds_map_create();
		ds_map_set(map, "p", 5);
		ds_map_set(map, "s", 4);
		ds_map_set(map, "a", 3);
		ds_map_set(map, "b", 2);
		ds_map_set(map, "c", 1);
		ds_map_set(map, "d", 0);
		for (var i = 0; i < array_length(lvl); i++)
		{
			var rank = ini_read_string("Ranks", lvl[i], "d");
			if (ds_map_find_value(map, rank) < ds_map_find_value(map, "p"))
				_found = true;
		}
		ds_map_destroy(map);
		ini_close();
		if (!_found)
			palette_unlock(name, "tv", 7);
	}
}, false, "Palettes", "tv");

add_achievement_notify("pal_dark", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 51 && (arr[0] == "pepperman" || arr[0] == "vigilante" || arr[0] == "noise" || arr[0] == "fakepep" || arr[0] == "pizzaface"))
	{
		ini_open_from_string(obj_savesystem.ini_str);
		var _found = false;
		var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"];
		for (var i = 0; i < array_length(ach); i++)
		{
			if (ini_read_real("achievements", ach[i], false) == 0)
				_found = true;
		}
		ini_close();
		if (!_found)
			palette_unlock(name, "dark", 8);
	}
}, false, "Palettes", "dark");

add_achievement_notify("pal_shitty", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 52)
		palette_unlock(name, "shitty", 9);
}, false, "Palettes", "shitty");

add_achievement_notify("pal_golden", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 5)
	{
		ini_open_from_string(obj_savesystem.ini_str);
		var _found = false;
		var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
		var map = ds_map_create();
		ds_map_set(map, "p", 5);
		ds_map_set(map, "s", 4);
		ds_map_set(map, "a", 3);
		ds_map_set(map, "b", 2);
		ds_map_set(map, "c", 1);
		ds_map_set(map, "d", 0);
		for (var i = 0; i < array_length(lvl); i++)
		{
			var rank = ini_read_string("Ranks", lvl[i], "d");
			if (ds_map_find_value(map, rank) < ds_map_find_value(map, "s"))
				_found = true;
		}
		ds_map_destroy(map);
		ini_close();
		if (!_found)
			palette_unlock(name, "golden", 10);
	}
}, false, "Palettes", "golden");

add_achievement_notify("pal_garish", function()
{
	achievement_add_variable("garish_count", 0, true, false);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 54)
	{
		achievement_get_variable("garish_count").value += 1;
		if (achievement_get_variable("garish_count").value >= 50)
			palette_unlock(name, "garish", 11);
	}
}, false, "Palettes", "garish");

add_achievement_notify("pal_funny", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 50 && arr[0] >= 70 && arr[0] < 75)
		palette_unlock(name, "funny", 12, spr_peppattern1);
}, false, "Palettes", "funny");

add_achievement_notify("pal_itchy", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	
	// TODO check if this obj_grandpa (690) IS supposed to be an object
	if (global.leveltosave == "street" && type == 7 && arr[2] == obj_grandpa)
		palette_unlock(name, "itchy", 12, spr_peppattern2);
}, false, "Palettes", "itchy");

add_achievement_notify("pal_pizza", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 53)
		palette_unlock(name, "pizza", 12, spr_peppattern3);
}, false, "Palettes", "pizza");

add_achievement_notify("pal_stripes", function()
{
	achievement_add_variable("stripes_count", 0, true, false);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 35)
	{
		achievement_get_variable("stripes_count").value += 1;
		if (achievement_get_variable("stripes_count").value >= 30)
			palette_unlock(name, "stripes", 12, spr_peppattern4);
	}
}, false, "Palettes", "stripes");

add_achievement_notify("pal_goldemanne", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 51)
	{
		var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"];
		var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface", "sranks1", "sranks2", "sranks3", "sranks4", "sranks5"];
		for (var i = 0; i < array_length(lvl); i++)
		{
			var b = lvl[i]
			for (var j = 0; j < 3; j++)
				array_push(ach, concat(b, j + 1));
		}
		var _found = false;
		ini_open_from_string(obj_savesystem.ini_str);
		for (i = 0; i < array_length(ach); i++)
		{
			if (ini_read_real("achievements", ach[i], false) == 0)
			{
				_found = true;
				break;
			}
		}
		ini_close();
		if (!_found)
			palette_unlock(name, "goldemanne", 12, spr_peppattern5);
	}
}, false, "Palettes", "goldemanne");

add_achievement_notify("pal_badbones", function()
{
	achievement_add_variable("badbones_count", 0, true, false);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 7)
	{
		achievement_get_variable("badbones_count").value += 1;
		if (achievement_get_variable("badbones_count").value >= 50)
			palette_unlock(name, "bones", 12, spr_peppattern6);
	}
}, false, "Palettes", "bones");

add_achievement_notify("pal_pp", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 53)
	{
		ini_open_from_string(obj_savesystem.ini_str_options);
		var n = ini_read_real("Game", "beaten", 0);
		n++;
		ini_write_real("Game", "beaten", n);
		obj_savesystem.ini_str_options = ini_close();
		if (n >= 2)
			palette_unlock(name, "pp", 12, 3915);
	}
}, false, "Palettes", "pp");

add_achievement_notify("pal_war", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 5 && arr[0] == "war")
	{
		ini_open_from_string(obj_savesystem.ini_str);
		var n = ini_read_real("Attempts", "war", 0);
		ini_close();
		if (n <= 1)
			palette_unlock(name, "war", 12, 844);
	}
}, false, "Palettes", "war");

add_achievement_notify("pal_john", -4, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 55 && global.file_minutes < 135)
		palette_unlock(name, "john", 12, 3934);
}, false, "Palettes", "john");

add_achievement_notify("entrance1", function() {
	achievement_add_variable("entr1count", 0, false, true);
},
function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 14 && global.leveltosave == "entrance" && arr[0] == 63)
	{
		achievement_get_variable("entr1count").value += 1;
		if (achievement_get_variable("entr1count").value >= 16)
			achievement_unlock(name, "John Gutted", 3592, 0);
	}
});

add_achievement_notify("entrance2", function() {}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 5 && arr[0] == "entrance" && (arr[2] < 2 || (arr[2] == 2 && arr[3] <= 0)))
		achievement_unlock(name, "Let's Make This Quick", 3592, 1);
});

add_achievement_notify("entrance3", function() {
	achievement_add_variable("entr3count", 0, false, true)
},
function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if ((type == 50 && arr[0] >= 99 && global.leveltosave == "entrance") || (type == 2 && global.combo >= 99 && global.leveltosave == "entrance"))
		achievement_unlock(name, "Primate Rage", 3592, 2);
});

add_achievement_notify("medieval1", function(argument0)
{
	achievement_add_variable("med1count", 0, false, true);
	achievement_add_variable("med1hurt", false, false, true);
	achievement_add_variable("med1start", false, false, true);
},
function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "medieval")
	{
		if (type == 56)
			achievement_get_variable("med1start").value = true;
		else if (type == 32)
			achievement_get_variable("med1hurt").value = true;
		else if (type == 25)
		{
			if (achievement_get_variable("med1start").value == 1 && achievement_get_variable("med1hurt").value == 0)
				achievement_get_variable("med1count").value += 1;
			if (achievement_get_variable("med1count").value >= 5)
				achievement_unlock(name, "Shining Armor", 3473, 0);
			achievement_get_variable("med1hurt").value = false;
		}
	}
});

add_achievement_notify("medieval2", function(argument0) {
	achievement_add_variable("med2count", 0, false, true);
},
function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 4 && global.leveltosave == "medieval" && arr[1] == 681)
	{
		achievement_get_variable("med2count").value += 1;
		if (achievement_get_variable("med2count").value >= 10)
			achievement_unlock(name, "Spoonknight", 3473, 1);
	}
});

add_achievement_notify("medieval3", function(argument0) {},
function(argument0)
{
	var type = argument0[0];
	if (type == 2 && global.leveltosave == "medieval" && (obj_player1.state == 5 || (obj_player1.tauntstoredstate == 5 && obj_player1.state == 61)) && (obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend || obj_player1.sprite_index == obj_player1.spr_tumble))
		achievement_unlock(name, "Spherical", 3473, 2);
});
add_achievement_notify("ruin1", function(argument0)
{
	achievement_add_variable("ruin1hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 7 && global.leveltosave == "ruin" && arr[2] == 586)
		achievement_get_variable("ruin1hurt").value = true;
	else if (type == 5 && arr[0] == "ruin" && achievement_get_variable("ruin1hurt").value == 0)
		achievement_unlock(name, "Thrill Seeker", 1780, 0);
});
add_achievement_notify("ruin2", function(argument0)
{
	
}, function(argument0)
{
	var type = argument0[0];
	if (type == 34 && global.leveltosave == "ruin")
		achievement_unlock(name, "Volleybomb", 1780, 1);
});
add_achievement_notify("ruin3", function(argument0)
{
	achievement_add_variable("ruin3count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 33 && global.leveltosave == "ruin")
	{
		achievement_get_variable("ruin3count").value += 1;
		if (achievement_get_variable("ruin3count").value >= 350)
			achievement_unlock(name, "Delicacy", 1780, 2);
	}
});
add_achievement_notify("dungeon1", function(argument0)
{
	achievement_add_variable("dun1hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 37 && global.leveltosave == "dungeon")
		achievement_get_variable("dun1hurt").value = true;
	else if (type == 5 && arr[0] == "dungeon" && achievement_get_variable("dun1hurt").value == 0)
		achievement_unlock(name, "Very Very Hot Sauce", 2443, 0);
});
add_achievement_notify("dungeon2", function(argument0)
{
	
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.panic && type == 42 && global.leveltosave == "dungeon" && arr[0] >= 120)
		achievement_unlock(name, "Eruption Man", 2443, 1);
});
add_achievement_notify("dungeon3", function(argument0)
{
	achievement_add_variable("dun3hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 7 && global.leveltosave == "dungeon" && arr[2] == 810)
		achievement_get_variable("dun3hurt").value = true;
	else if (type == 5 && arr[0] == "dungeon" && achievement_get_variable("dun3hurt").value == 0)
		achievement_unlock(name, "Unsliced Pizzaman", 2443, 2);
});
add_achievement_notify("badland1", function(argument0)
{
	
}, function(argument0)
{
	var type = argument0[0];
	if (type == 48 && global.leveltosave == "badland")
		achievement_unlock(name, "Peppino's Rain Dance", 4176, 0);
});
add_achievement_notify("badland2", function(argument0)
{
	achievement_add_variable("bad2count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 2 && global.leveltosave == "badland" && arr[2] == 401)
	{
		achievement_get_variable("bad2count").value += 1;
		if (achievement_get_variable("bad2count").value >= 5)
			achievement_unlock(name, "Unnecessary Violence", 4176, 1);
	}
});
add_achievement_notify("badland3", function(argument0)
{
	achievement_add_variable("bad3hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 38 && global.leveltosave == "badland")
		achievement_get_variable("bad3hurt").value = true;
	else if (type == 5 && arr[0] == "badland" && achievement_get_variable("bad3hurt").value == 0)
		achievement_unlock(name, "Alien Cow", 4176, 2);
});
add_achievement_notify("graveyard1", function(argument0)
{
	achievement_add_variable("grav1hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 40 && global.leveltosave == "graveyard")
		achievement_get_variable("grav1hurt").value = true;
	else if (type == 5 && arr[0] == "graveyard" && achievement_get_variable("grav1hurt").value == 0)
		achievement_unlock(name, "Ghosted", 3763, 0);
});
add_achievement_notify("graveyard2", function(argument0)
{
	achievement_add_variable("grav2count", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "graveyard")
	{
		if (type == 2 && (obj_player1.state == 16 || (obj_player1.state == 61 && obj_player1.tauntstoredstate == 16)))
		{
			achievement_get_variable("grav2count").value += 1;
			if (achievement_get_variable("grav2count").value >= 20)
				achievement_unlock(name, "Pretend Ghost", 3763, 1);
		}
	}
});
add_achievement_notify("graveyard3", function(argument0)
{
	achievement_add_variable("grav3count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 39 && global.leveltosave == "graveyard")
	{
		achievement_get_variable("grav3count").value += 1;
		if (achievement_get_variable("grav3count").value >= 10)
			achievement_unlock(name, "Alive and Well", 3763, 2);
	}
});
add_achievement_notify("farm1", function(argument0)
{
	achievement_add_variable("f1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 3)
	{
		var n = achievement_get_variable("f1_count");
		var r = room_get_name(arr[1]);
		if (obj_player.state == 84 && (string_letters(r) == "farm" || string_letters(r) == "farmb"))
		{
			n.value++;
			if (n.value >= 3)
				achievement_unlock(name, "No one is safe", 3078, 2);
		}
	}
});
add_achievement_notify("farm2", -4, function(argument0)
{
	var type = argument0[0];
	if (type == 6)
		achievement_unlock(name, "Cube Menace", 3078, 1);
});
add_achievement_notify("farm3", function(argument0)
{
	achievement_add_variable("f3_hurted", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if ((type == 7 || type == 8) && (arr[1] == 11 || arr[1] == 14 || arr[1] == 13 || arr[1] == 12))
		achievement_get_variable("f3_hurted").value = true;
	if (type == 5 && arr[0] == "farm" && !achievement_get_variable("f3_hurted").value)
		achievement_unlock(name, "Good Egg", 3078, 0);
});
add_achievement_notify("saloon1", function(argument0)
{
	achievement_add_variable("s1_beer", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 9 && global.leveltosave == "saloon")
	{
		achievement_get_variable("s1_beer").value += 1;
		if (achievement_get_variable("s1_beer").value >= 58)
			achievement_unlock(name, "Non-Alcoholic", 3939, 0);
	}
});
add_achievement_notify("saloon2", function(argument0)
{
	achievement_add_variable("s2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 10 && global.leveltosave == "saloon")
		achievement_get_variable("s2_count").value += 1;
	else if (type == 5)
	{
		var arr = argument0[1];
		if (arr[0] == "saloon" && achievement_get_variable("s2_count").value == 9)
			achievement_unlock(name, "Already Pressed", 3939, 1);
	}
});
add_achievement_notify("saloon3", function(argument0)
{
	achievement_add_variable("s3_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 11 && global.leveltosave == "saloon")
	{
		achievement_get_variable("s3_count").value += 1;
		if (achievement_get_variable("s3_count").value >= 12)
			achievement_unlock(name, "Royal Flush", 3939, 2);
	}
});
add_achievement_notify("plage1", function(argument0)
{
	
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 12 && global.leveltosave == "plage" && arr[1] == 661 && arr[3] == 527)
		achievement_unlock(name, "Blowback", 3350, 0);
});
add_achievement_notify("plage2", function(argument0)
{
	achievement_add_variable("b2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 13 && global.leveltosave == "plage" && arr[1] == 649)
	{
		achievement_get_variable("b2_count").value += 1;
		if (achievement_get_variable("b2_count").value >= 7)
			achievement_unlock(name, "X Marks The Spot", 3350, 1);
	}
});
add_achievement_notify("plage3", function(argument0)
{
	achievement_add_variable("b3_hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 7 && global.leveltosave == "plage" && arr[2] == 586)
		achievement_get_variable("b3_hurt").value = true;
	else if (type == 5 && arr[0] == "plage" && achievement_get_variable("b3_hurt").value == 0)
		achievement_unlock(name, "Demolition Expert", 3350, 2);
});
add_achievement_update("forest1", 5, -4, function(argument0)
{
	if (global.leveltosave == "forest")
	{
		var b = false;
		with (obj_player)
		{
			if (!b && state == 84 && distance_to_object(obj_beedeco) < 300)
				b = true;
		}
		if (b)
			achievement_unlock(name, "Bee Nice", 3980, 0);
	}
});
add_achievement_notify("forest2", function(argument0)
{
	achievement_add_variable("fo2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 14 && global.leveltosave == "forest" && (arr[0] == 461 || arr[0] == 482))
	{
		achievement_get_variable("fo2_count").value += 1;
		if (achievement_get_variable("fo2_count").value >= 183)
			achievement_unlock(name, "Lumberjack", 3980, 1);
	}
});
add_achievement_notify("forest3", function() {},
function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 12 && global.leveltosave == "forest" && arr[1] == obj_noisegoblin && arr[3] == obj_noisegoblin_arrow)
		achievement_unlock(name, "Bullseye", spr_achievement_forest, 2);
});
add_achievement_update("space1", 1, function(argument0)
{
	achievement_add_variable("sp1_hit", false, false, true);
}, function(argument0)
{
	if (room == space_10)
	{
		if (instance_exists(obj_fadeout))
		{
			if (obj_player1.targetDoor == "B")
				achievement_get_variable("sp1_hit").value = false;
		}
		var b = false;
		with (obj_antigravbubble)
		{
			if (sprite_index == spr_antigrav_bubblesquish)
				b = true;
		}
		if (b)
			achievement_get_variable("sp1_hit").value = true;
		var _q = false;
		with (obj_player1)
		{
			if (y < 608)
				_q = true;
		}
		if (_q && achievement_get_variable("sp1_hit").value == 0)
			achievement_unlock(name, "Turbo Tunnel", 476, 0);
	}
});
add_achievement_notify("space2", function(argument0)
{
	achievement_add_variable("sp2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 14 && global.leveltosave == "space" && arr[0] == 505)
	{
		achievement_get_variable("sp2_count").value += 1;
		if (achievement_get_variable("sp2_count").value >= 18)
			achievement_unlock(name, "Blast Em Asteroids", 476, 2);
	}
});
add_achievement_notify("space3", function(argument0)
{
	achievement_add_variable("space3count", 0, false, true);
	achievement_add_variable("space3start", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "space")
	{
		if (type == 0)
			achievement_get_variable("space3start").value = true;
		else if (achievement_get_variable("space3start").value == 1 && type == 2 && arr[2] == 686)
		{
			achievement_get_variable("space3count").value += 1;
			trace("Meteor Man Count: ", achievement_get_variable("space3count").value);
			if (achievement_get_variable("space3count").value >= 5)
				achievement_unlock(name, "Man Meteor", 476, 1);
		}
		else if (type == 1)
		{
			achievement_get_variable("space3start").value = false;
			achievement_get_variable("space3count").value = 0;
		}
	}
});
add_achievement_notify("minigolf1", function(argument0)
{
	achievement_add_variable("g1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 18 && arr[0] == 3738)
	{
		achievement_get_variable("g1_count").value += 1;
		if (achievement_get_variable("g1_count").value >= 9)
			achievement_unlock(name, "Primo Golfer", 1653, 0);
	}
});
add_achievement_notify("minigolf2", function(argument0)
{
	achievement_add_variable("g2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 16 && (arr[0] == 530 || arr[0] == 530))
		achievement_get_variable("g2_count").value = 0;
	else if (type == 17)
	{
		achievement_get_variable("g2_count").value += 1;
		if (achievement_get_variable("g2_count").value >= 3)
			achievement_unlock(name, "Nice Shot", 1653, 1);
	}
});
add_achievement_notify("minigolf3", function(argument0)
{
	achievement_add_variable("g3_hit", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 16)
	{
		if (arr[0] == 1054)
			achievement_get_variable("g3_hit").value = true;
		else
			achievement_get_variable("g3_hit").value = false;
	}
	else if (type == 18 && achievement_get_variable("g3_hit").value == 1)
		achievement_unlock(name, "Helpful Burger", 1653, 2);
});
add_achievement_update("street1", 60, -4, function(argument0)
{
	if (room == street_bacon)
		achievement_unlock(name, "Pan Fried", 1789, 0);
});
add_achievement_notify("street2", function(argument0)
{
	achievement_add_variable("st2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (global.leveltosave == "street")
	{
		if (type == 19)
			achievement_get_variable("st2_count").value = 0;
		else if (type == 21)
		{
			achievement_get_variable("st2_count").value += 1;
			if (achievement_get_variable("st2_count").value >= 3)
				achievement_unlock(name, "Strike!", 1789, 1);
		}
	}
});
add_achievement_notify("street3", function(argument0)
{
	achievement_add_variable("st3_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 22)
	{
		achievement_get_variable("st3_count").value += 1;
		if (achievement_get_variable("st3_count").value >= 14)
			achievement_unlock(name, "Say Oink!", 1789, 2);
	}
});
add_achievement_notify("sewer1", function(argument0)
{
	achievement_add_variable("sw1_killed", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 23)
		achievement_get_variable("sw1_killed").value = true;
	else if (type == 5 && arr[0] == "sewer" && achievement_get_variable("sw1_killed").value == 0)
		achievement_unlock(name, "Can't Fool Me", 3669, 0);
});
add_achievement_notify("sewer2", function(argument0)
{
	achievement_add_variable("sw2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "sewer" && type == 4 && arr[1] == 680)
	{
		achievement_get_variable("sw2_count").value += 1;
		if (achievement_get_variable("sw2_count").value >= 10)
			achievement_unlock(name, "Food Clan", 3669, 1);
	}
});
add_achievement_notify("sewer3", function(argument0)
{
	achievement_add_variable("sw3_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "sewer" && global.panic && type == 24)
		achievement_get_variable("sw3_count").value += 1;
	else if (type == 5 && arr[0] == "sewer" && achievement_get_variable("sw3_count").value <= 0)
		achievement_unlock(name, "Penny Pincher", 3669, 2);
});
add_achievement_notify("industrial1", function(argument0)
{
	achievement_add_variable("i1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "industrial" && type == 25 && (arr[2] == 33 || arr[2] == 35 || arr[2] == 34))
	{
		achievement_get_variable("i1_count").value += 1;
		if (achievement_get_variable("i1_count").value >= 4)
			achievement_unlock(name, "Unflattenning", 1406, 0);
	}
});
add_achievement_notify("industrial2", function(argument0)
{
	achievement_add_variable("i2_count", 0, false, true);
	achievement_add_variable("i2_hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (room == industrial_secret1)
	{
		if (type == 2 && arr[2] == 217)
			achievement_get_variable("i2_count").value += 1;
		else if (type == 7)
			achievement_get_variable("i2_hurt").value = true;
	}
	if (type == 27 && arr[0] == 678 && achievement_get_variable("i2_hurt").value == 0 && achievement_get_variable("i2_count").value >= 11)
		achievement_unlock(name, "Whoop This", 1406, 1);
});
add_achievement_notify("industrial3", function(argument0)
{
	achievement_add_variable("i3_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "industrial" && type == 2 && arr[2] == 657)
	{
		achievement_get_variable("i3_count").value += 1;
		if (achievement_get_variable("i3_count").value >= 31)
			achievement_unlock(name, "There Can Be Only One", 1406, 2);
	}
});
add_achievement_notify("freezer1", function(argument0)
{
	achievement_add_variable("fr1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (global.leveltosave == "freezer" && type == 28)
	{
		achievement_get_variable("fr1_count").value += 1;
		if (achievement_get_variable("fr1_count").value >= 13)
			achievement_unlock(name, "Frozen Nuggets", 4167, 0);
	}
});
add_achievement_notify("freezer2", function(argument0)
{
	achievement_add_variable("fr2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "freezer" && type == 2 && arr[2] == 907)
	{
		achievement_get_variable("fr2_count").value += 1;
		if (achievement_get_variable("fr2_count").value >= 5)
			achievement_unlock(name, "Frozen Nuggets", 4167, 1);
	}
});
add_achievement_notify("freezer3", function(argument0)
{
	achievement_add_variable("fr3_fall", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 8 && global.leveltosave == "freezer")
		achievement_get_variable("fr3_fall").value = true;
	else if (type == 5 && arr[0] == "freezer" && achievement_get_variable("fr3_fall").value == 0)
		achievement_unlock(name, "Ice Climber", 4167, 2);
});
add_achievement_notify("chateau1", function(argument0)
{
	achievement_add_variable("ch1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "chateau" && type == 2 && arr[2] == 259)
	{
		achievement_get_variable("ch1_count").value += 1;
		if (achievement_get_variable("ch1_count").value >= 30)
			achievement_unlock(name, "Cross To Bare", 2345, 0);
	}
});
add_achievement_notify("chateau2", function(argument0)
{
	achievement_add_variable("ch2_hurt", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 7 && (arr[2] == 556 || arr[2] == 302))
		achievement_get_variable("ch2_hurt").value = true;
	if (type == 5 && arr[0] == "chateau" && !achievement_get_variable("ch2_hurt").value)
		achievement_unlock(name, "Haunted Playground", 2345, 1);
});
add_achievement_notify("chateau3", function(argument0)
{
	achievement_add_variable("ch3_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 15 && global.leveltosave == "chateau")
	{
		achievement_get_variable("ch3_count").value += 1;
		if (achievement_get_variable("ch3_count").value >= 10)
			achievement_unlock(name, "Skullsplitter", 2345, 2);
	}
});
add_achievement_notify("kidsparty1", function(argument0)
{
	achievement_add_variable("kp1_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	if (type == 29 && global.leveltosave == "kidsparty" && global.panic && room != kidsparty_secret1)
	{
		achievement_get_variable("kp1_count").value += 1;
		if (achievement_get_variable("kp1_count").value >= 9)
			achievement_unlock(name, "And This... Is My Gun-On-A-Stick!", 3572, 0);
	}
});
add_achievement_notify("kidsparty2", function(argument0)
{
	achievement_add_variable("kp2_count", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 30 && global.leveltosave == "kidsparty" && !global.panic)
		achievement_get_variable("kp2_count").value += 1;
	else if (type == 20 && arr[0] == 609)
	{
		if (achievement_get_variable("kp2_count").value <= 6)
			achievement_unlock(name, "Let Them Sleep", 3572, 1);
	}
});
add_achievement_notify("kidsparty3", function(argument0)
{
	achievement_add_variable("kp3_hurted", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 31 && global.leveltosave == "kidsparty")
		achievement_get_variable("kp3_hurted").value = true;
	else if (type == 5 && arr[0] == "kidsparty")
	{
		if (achievement_get_variable("kp3_hurted").value == 0)
			achievement_unlock(name, "Jumpspared", 3572, 2);
	}
});
add_achievement_notify("war1", function(argument0)
{
	achievement_add_variable("war1hurt", 0, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 7 && global.leveltosave == "war")
		achievement_get_variable("war1hurt").value += 1;
	else if (type == 5 && arr[0] == "war" && achievement_get_variable("war1hurt").value < 3)
		achievement_unlock(name, "Decorated Veteran", 737, 0);
});
add_achievement_notify("war2", function(argument0)
{
	achievement_add_variable("war2_missed", 0, false, true);
	achievement_add_variable("war2_hit", false, false, true);
	achievement_add_variable("war2_start", false, false, true);
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (global.leveltosave == "war")
	{
		if (type == 43)
		{
			achievement_get_variable("war2_hit").value = false;
			achievement_get_variable("war2_start").value = true;
		}
		else if ((type == 2 || type == 3 || type == 45 || type == 46) && achievement_get_variable("war2_start").value == 1)
			achievement_get_variable("war2_hit").value = true;
		else if (type == 44)
		{
			var val = achievement_get_variable("war2_hit").value;
			achievement_get_variable("war2_start").value = false;
			if (!val)
			{
				achievement_get_variable("war2_missed").value += 1;
				trace("Shot missed!");
			}
		}
	}
	if (type == 5 && arr[0] == "war" && achievement_get_variable("war2_missed").value < 3)
		achievement_unlock(name, "Sharpshooter", 737, 1);
});
add_achievement_notify("war3", function(argument0)
{
	
}, function(argument0)
{
	var type = argument0[0];
	var arr = argument0[1];
	if (type == 47 && arr[0] >= 1)
		achievement_unlock(name, "Trip to the Warzone", 737, 2);
});
