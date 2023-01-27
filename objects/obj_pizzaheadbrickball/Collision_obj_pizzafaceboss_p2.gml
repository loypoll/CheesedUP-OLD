if (comeback)
{
	if (other.state == 74 && other.brick)
	{
		other.sprite_index = spr_pizzahead_ratballcatch;
		other.image_index = 0;
	}
	instance_destroy();
}
