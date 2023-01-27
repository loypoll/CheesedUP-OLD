if (state != 74 && (other.hsp != 0 || other.thrown || other.state == 5))
{
	pizzaball = true;
	golfid = other.id;
	shot = false;
	state = 74;
	other.bigcheeseID = id;
	other.sprite_index = spr_pizzaball_roll;
	sprite_index = spr_bigcheese_throw;
	image_index = 0;
	depth = -10;
}
