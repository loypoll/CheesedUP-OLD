if (sprite_index != spr_rattumbleblock && other.rat)
{
	if (other.baddie)
		notification_push(34, [room]);
	instance_destroy();
}
