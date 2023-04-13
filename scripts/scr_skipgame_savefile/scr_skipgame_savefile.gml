function scr_skipgame_savefile()
{
	ini_open("saves/" + get_savefile_ini());
	
	// world sticks
	var worlds = ["w1stick", "w2stick", "w3stick", "w4stick", "w5stick"];
	for(var i = 0; i < array_length(worlds); i++)
	{
		ini_write_real(worlds[i], "door", true);
		ini_write_real(worlds[i], "unlocked", true);
		ini_write_real(worlds[i], "first", true);
		ini_write_real(worlds[i], "bosskey", true);
	}
	
	// etc
	ini_write_string("Ranks", "finalrank", "");
	ini_write_string("Ranks", "exit", "");
	ini_write_real("Tutorial", "finished", true);
	ini_write_real("Tutorial", "tutorialcutscene", true);
	ini_write_real("Tutorial", "lapunlocked", true);
	ini_write_real("Game", "fakepepportrait", true);
	ini_write_real("Game", "supertaunt", true);
	
	obj_savesystem.ini_str = ini_close();
	gamesave_async_save();
}
