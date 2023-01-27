if (room == rm_editor)
	exit;
switch (state)
{
	case 126:
		scr_enemy_idle();
		break;
	case 130:
		scr_enemy_turn();
		break;
	case 134:
		sprite_index = spr_lonegustavo_grabbable;
		image_speed = 0.35;
		hsp = 0;
		var _boss = -4;
		with (obj_baddie)
		{
			if (object_index != obj_gustavograbbable)
				_boss = id;
		}
		if (_boss != -4)
		{
			if (_boss.x != x)
				image_xscale = sign(_boss.x - x);
		}
		break;
	case 136:
		scr_enemy_land();
		break;
	case 137:
		scr_enemy_hit();
		break;
	case 138:
		scr_enemy_stun();
		if (sprite_index == spr_dead)
			sprite_index = spr_lonegustavo_dashjump;
		break;
	case 129:
		scr_pizzagoblin_throw();
		break;
	case 294:
		scr_boss_pizzaheadjump();
		break;
	case 4:
		scr_enemy_grabbed();
		break;
	case 154:
		scr_enemy_pummel();
		break;
	case 155:
		scr_enemy_staggered();
		break;
	case 125:
		scr_enemy_rage();
		break;
	case 17:
		scr_enemy_ghostpossess();
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
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
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
