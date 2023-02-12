if (room == rm_editor)
	exit;
targetplayer = instance_nearest(x, y, obj_player);
if (ceiling && (state == 100 || state == 80))
	grav = 0;
else if (ceiling && (state != 100 && state != 80))
	grav = 0.5;
switch (state)
{
	case states.idle:
		scr_enemy_idle();
		break;
	case states.turn:
		scr_enemy_turn();
		break;
	case states.walk:
		ceiling = false;
		state = 100;
		grav = 0.5;
		break;
	case states.land:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case states.pizzagoblinthrow:
		scr_pizzagoblin_throw();
		break;
	case states.grabbed:
		scr_enemy_grabbed();
		break;
	case states.pummel:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
	case states.rage:
		scr_enemy_rage();
		break;
	case 17:
		scr_enemy_ghostpossess();
		break;
	case states.punch:
		hidden = false;
		cooldown = 100;
		if (sprite_index != spr_attack)
		{
			sprite_index = spr_attack;
			image_index = 0;
			with (instance_create(x, y, obj_forkhitbox))
			{
				visible = false;
				sprite_index = other.sprite_index;
				other.hitboxID = id;
				ID = other.id;
			}
		}
		else if (floor(image_index) == (image_number - 1))
		{
			image_speed = 0.35;
			state = 100;
			instance_destroy(hitboxID);
			sprite_index = spr_hidden;
		}
		break;
	case 100:
		if (hidden)
		{
			sprite_index = spr_hidden;
			if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y < (y + 300) && targetplayer.y > (y - 300))
			{
				hidden = false;
				state = 80;
			}
		}
		else
		{
			sprite_index = spr_hidden;
			if (cooldown > 0)
				cooldown--;
			else
				state = 80;
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
if (hidden)
	invincible = true;
else
	invincible = false;
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
