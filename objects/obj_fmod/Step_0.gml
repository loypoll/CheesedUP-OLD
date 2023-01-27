steam_update();
if (!global.steam_api)
{
	if (steam_initialised())
	{
		if (steam_stats_ready())
			global.steam_api = true;
	}
}
