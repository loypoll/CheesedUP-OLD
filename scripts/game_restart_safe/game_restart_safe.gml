global.game_restarting = false;

function game_restart_safe()
{
	global.game_restarting = true;
	game_restart();
}
function game_is_restarting() {
	return global.game_restarting;
}
