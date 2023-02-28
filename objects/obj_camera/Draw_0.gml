// out of bounds player
if live_call() return live_result;

var player = obj_player1;
if !instance_exists(player)
	exit;

if player.state == states.debugstate
{
	if !point_in_camera(player.x, player.y)
	{
		
	}
}
