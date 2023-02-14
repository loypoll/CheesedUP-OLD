if (state != 74)
{
	pizzaball = false;
	playerid = other.id;
	shot = false;
	state = 74;
	sprite_index = spr_bigcheese_throw;
	image_index = 0;
	other.state = states.actor;
	other.sprite_index = other.spr_tumble;
}
