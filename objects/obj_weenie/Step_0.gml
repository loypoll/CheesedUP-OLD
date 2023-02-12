if (room == rm_editor)
	exit;
if (state != 138 && state != 5)
	stunstate = 0;
else if (state == 138)
{
	if (stunstate == 0 && stunned > 50 && grounded)
	{
		stunstate = 1;
		stunned = 0;
		state = 5;
		stuntimer = stunmax;
	}
}
invincible = state == 5;
switch (state)
{
	case 126:
		scr_enemy_idle();
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
	case 5:
		grav = 0.5;
		sprite_index = spr_sausagemannocigar_rolling;
		hsp = image_xscale * 7;
		angle = 0;
		if (scr_solid(x + sign(hsp), y) && (!place_meeting(x, y + 1, obj_slope) || place_meeting(x + sign(hsp), y - 5, obj_solid)))
			image_xscale *= -1;
		if (stuntimer > 0)
			stuntimer--;
		else
			state = 138;
		if (!instance_exists(hitboxID))
		{
			hitboxID = instance_create(x, y, obj_weeniehitbox);
			hitboxID.baddieID = id;
		}
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
scr_scareenemy();
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
