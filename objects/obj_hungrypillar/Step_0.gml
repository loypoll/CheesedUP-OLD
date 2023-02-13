if (room == rm_editor)
	exit;
if (sprite_index != spr_protojohn)
{
	var player = obj_player1.id;
	if (player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300) && (player.state == states.chainsawbump || player.ratmount_movespeed == 12 || player.state == 121 || player.state == 31 || player.state == 184 || player.state == 20 || player.state == 38 || (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
		sprite_index = spr_hungrypillar_angry;
	else
		sprite_index = spr_hungrypillar;
}
