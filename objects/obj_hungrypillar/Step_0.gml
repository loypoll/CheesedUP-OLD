if (room == rm_editor)
	exit;
if (sprite_index != spr_protojohn)
{
	var player = obj_player1.id;
	if (player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300) && (player.state == states.chainsawbump or player.ratmount_movespeed == 12 or player.state == states.mach3 or player.state == states.rideweenie or player.state == states.rocket or player.state == states.tacklecharge or player.state == states.knightpepslopes or (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
		sprite_index = angryspr;
	else
		sprite_index = idlespr;
}
