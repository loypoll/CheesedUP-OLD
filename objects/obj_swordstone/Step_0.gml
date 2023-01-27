if (room == rm_editor)
	exit;
if (obj_player.state == 47 || (obj_player.state == 61 && (obj_player.tauntstoredstate == 47 || obj_player.tauntstoredstate == 38)) || obj_player.state == 48 || obj_player.state == 38 || obj_player.state == 49)
	sprite_index = spr_swordstonetaken;
else
	sprite_index = spr_swordstone;
if (sprite_index == spr_swordstone && !instance_exists(ID) && room != boss_pizzaface)
{
	with (instance_create(x, y - 20, obj_grabmarker))
		other.ID = id;
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
	instance_destroy(ID);
