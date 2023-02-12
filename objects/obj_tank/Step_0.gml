if (room == rm_editor)
	exit;
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
	case states.walk:
		scr_enemy_walk();
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
	case 154:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
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
if (state == 138 && lasthp != hp && !tired && grounded)
{
	tired = true;
	stunned = 10;
	lasthp = hp;
	killprotection = false;
}
if (state != 138)
	birdcreated = false;
if (stuntouchbuffer > 0)
	stuntouchbuffer--;
if (!instance_exists(spawnenemyID) && state == 134)
{
	state = 126;
	sprite_index = spr_tank_spawnenemy;
	image_index = 0;
	with (instance_create(x, y - 18, content))
	{
		important = true;
		other.spawnenemyID = id;
	}
}
var player = instance_nearest(x, y, obj_player);
if (bombreset > 0)
	bombreset--;
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)))
{
	if (state != 125 && bombreset <= 0 && (global.stylethreshold >= 3 || elite) && state == 134)
	{
		state = 125;
		sprite_index = spr_tank_chargestart;
		if (x != player.x)
			image_xscale = -sign(x - player.x);
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		bombreset = 200;
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if (x != player.x && state != 125 && grounded && bombreset <= 0)
	{
		if (state == 134)
		{
			state = 129;
			hsp = 0;
			sprite_index = spr_tank_shoot;
		}
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (hitboxcreate == 0 && state == 125)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_minijohn_hitbox))
		ID = other.id;
}
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
if (boundbox == 0)
{
	with (instance_create(x, y, obj_baddiecollisionbox))
	{
		sprite_index = other.sprite_index;
		baddieID = other.id;
		other.boundbox = true;
	}
}
