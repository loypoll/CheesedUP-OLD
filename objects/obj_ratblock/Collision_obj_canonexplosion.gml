if (sprite_index != spr_rattumbleblock && other.rat)
{
	if (other.baddie)
		notification_push(notifs.ratblock_explode, [room]);
	instance_destroy();
}
