switch (state)
{
	case 126:
		scr_enemy_idle();
		break;
	case 128:
		scr_enemy_charge();
		break;
	case 130:
		scr_enemy_turn();
		break;
	case 134:
		hsp = 0;
		break;
	case 136:
		scr_enemy_land();
		break;
	case 137:
		scr_enemy_hit();
		break;
	case 138:
		scr_enemy_stun();
		break;
	case 129:
		scr_pizzagoblin_throw();
		break;
	case 4:
		scr_enemy_grabbed();
		break;
	case 125:
		scr_enemy_rage();
		break;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 138)
	birdcreated = false;
var player = instance_nearest(x, y, obj_player);
if (bombreset > 0)
	bombreset--;
if (x != player.x && grounded && player.x > (x - 500) && player.x < (x + 500) && player.y > (y - 500) && player.y < (y + 500) && !instance_exists(bazookaID))
{
	if (state == 134 && bombreset <= 0)
	{
		if (x != player.x)
			image_xscale = -sign(x - player.x);
		image_index = 0;
		state = 129;
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (floor(image_index) == (image_number - 1) && sprite_index == spr_spitcheese_spit)
	sprite_index = spr_spitcheese_idle;
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		mask_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
