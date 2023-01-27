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
	case 294:
		scr_enemy_pizzaheadjump();
		break;
}
if (sprite_index != spr_pizzaboy)
	usepalette = true;
if (state != 128 && sprite_index != spr_pizzaboy)
	scr_scareenemy();
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 138)
	birdcreated = false;
targetplayer = instance_nearest(x, y, obj_player);
if (state == 134)
{
	if (sprite_index == spr_pizzaboy)
		hsp = 0;
	else
	{
		move = sign(targetplayer.x - x);
		if (move != 0)
			image_xscale = move;
		if (movespeed < 4)
			movespeed += 0.25;
		if (abs(x - targetplayer.x) < 230)
		{
			hsp = -move * movespeed;
			if (move != 0 && move != -dir)
				movespeed = 2;
		}
		else if (abs(x - targetplayer.x) > 240)
		{
			hsp = move * movespeed;
			if (move != 0 && move != dir)
				movespeed = 2;
		}
		else
		{
			hsp = 0;
			movespeed = 0;
		}
		trace(movespeed, "   ", hsp);
		if (hsp != 0)
			dir = sign(hsp);
	}
}
else if (state == 80)
{
	image_speed = 0.35;
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		state = 134;
		sprite_index = walkspr;
	}
	if (image_index > 4 && image_index < 14)
	{
		if (!hitboxcreate)
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/ninjakicks", x, y);
			hitboxcreate = true;
			with (instance_create(x, y, obj_forkhitbox))
			{
				sprite_index = spr_bighitbox;
				mask_index = spr_bighitbox;
				ID = other.id;
			}
		}
	}
	if (sprite_index == spr_ninja_punchattack)
	{
		if (floor(image_index) != 5 && floor(image_index) != 8 && floor(image_index) != 11)
			shot = false;
		else if (!shot)
		{
			with (instance_create(x, y + 6, obj_enemybullet))
				image_xscale = other.image_xscale;
		}
	}
}
if (sprite_index == spr_pizzaboy)
{
	if (x != targetplayer.x && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 150) && targetplayer.y < (y + 20))
	{
		if (state == 134 || state == 126)
		{
			if (sprite_index == spr_pizzaboy)
				create_particle(x, y, 6, 0);
			fmod_event_one_shot_3d("event:/sfx/pep/uppercut", x, y);
			image_xscale = -sign(x - targetplayer.x);
			sprite_index = spr_ninja_uppercut;
			image_index = 0;
			state = 128;
			roaming = true;
			vsp = -14;
			hsp = image_xscale * 4;
			inv_timer = 5;
			alarm[4] = 5;
			with (instance_create(x, y, obj_forkhitbox))
			{
				sprite_index = spr_bighitbox;
				mask_index = spr_bighitbox;
				ID = other.id;
			}
		}
	}
}
else if (state == 134 && attack_buffer <= 0)
{
	attack_buffer = attack_max + irandom_range(-attack_random, attack_random);
	state = 80;
	hsp = 0;
	hitboxcreate = false;
	if (!elite)
	{
		sprite_index = spr_ninja_kickattack;
		image_index = 0;
	}
	else
	{
		sprite_index = spr_ninja_punchattack;
		image_index = 0;
	}
}
if (attack_buffer > 0)
	attack_buffer--;
if (inv_timer > 0)
{
	inv_timer--;
	invincible = true;
}
else
	invincible = false;
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
