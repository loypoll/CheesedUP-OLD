var player = other;
if player.key_up2 && player.state == states.normal
{
	player.key_up2 = false;
	instance_create_unique(0, 0, obj_skinchoice);
}
