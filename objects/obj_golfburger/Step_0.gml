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
if (golfcooldown > 0)
	golfcooldown--;
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
if (state == 74)
{
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		state = 134;
		sprite_index = walkspr;
		golfcooldown = 100;
	}
	if (!shot)
	{
		golfcooldown = 100;
		with (golfid)
		{
			invincible = true;
			hsp = 0;
			vsp = 0;
			sprite_index = stunfallspr;
			image_xscale = other.image_xscale;
			x = other.x + (other.image_xscale * 24);
			y = (other.y + 23) - 25;
		}
	}
	if (floor(image_index) >= 6 && !shot)
	{
		shot = true;
		notification_push(notifs.pizzaball, [object_index]);
		with (golfid)
		{
			invincible = false;
			x = other.x;
			y = other.y;
			fmod_event_one_shot_3d("event:/sfx/misc/golfpunch", x, y);
			scr_pizzaball_go_to_thrown(14 * other.image_xscale, -7, false);
		}
		golfcooldown = 100;
		golfid = -4;
	}
}
if (state != 74)
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
