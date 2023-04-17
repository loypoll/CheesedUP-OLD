// frames elapsed ingame, not paused
if !safe_get(obj_pause, "pause")
	global.time++;

// force pistol and chainsaw off
if global.jeofmode
{
	global.shootstyle = 0;
	global.doublegrab = 0;
}

// handle steam
if STEAM
{
	steam_update();
	global.steam_api = (steam_initialised() && steam_stats_ready() && steam_is_overlay_enabled());
}
