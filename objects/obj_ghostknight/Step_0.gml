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
scr_scareenemy();
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (hitboxcreate == 0 && state == 134)
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
		ID = other.id;
}
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
