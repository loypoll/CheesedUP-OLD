if (room == rm_editor)
	exit;
image_speed = 0.35;
targetplayer = obj_player1.id;
wastedhits = maxhp - elitehit;
switch (state)
{
	case 144:
		scr_pizzaface_p3_arenaintro();
		break;
	case 135:
		scr_pizzaface_p3_fall();
		break;
	case 155:
		scr_pizzaface_p3_staggered();
		break;
	case 134:
		scr_pizzaface_p3_walk();
		break;
	case 288:
		scr_pizzaface_p3_stomp();
		break;
	case 80:
		scr_pizzaface_p3_punch();
		break;
	case 92:
		scr_pizzaface_p3_jump();
		break;
	case 74:
		scr_pizzaface_p3_throwing();
		break;
	case 287:
		scr_pizzaface_p3_swinging();
		break;
	case 289:
		scr_pizzaface_p3_finale();
		break;
	case 294:
		scr_boss_pizzaheadjump();
		break;
	case 137:
		scr_enemy_hit();
		break;
	case 138:
		scr_enemy_stun();
		break;
	case 4:
		scr_boss_grabbed();
		break;
	case 154:
		scr_enemy_pummel();
		break;
}
if (state != 294)
{
	if ((state == 135 && vsp < 0) || state == 289)
	{
		use_collision = false;
		if (state == 135)
		{
			x += hsp;
			y += vsp;
			if (vsp < 20)
				vsp += grav;
		}
	}
	else
		use_collision = true;
}
if (prevhp != elitehit)
{
	if (elitehit < prevhp)
	{
		currentattack = 0;
		vulnerable_buffer = 0;
		laugh = 0;
		pizzahead_subhp = pizzahead_maxsubhp;
		global.playerhit++;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		alarm[6] = 5;
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
if (state == 138)
{
	if (thrown)
		savedthrown = true;
	if (grounded && vsp > 0 && savedthrown)
	{
		stunned = 1;
		idle_timer = 1;
		ammo = 6;
	}
}
else
	savedthrown = false;
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if ((state == 80 || state == 288 || state == 287 || state == 92) && alarm[4] == -1)
	alarm[4] = 5;
invincible = true;
if (vulnerable_buffer > 0 && state == 134 && flickertime <= 0)
{
	vulnerable_buffer--;
	invincible = false;
}
if (state == 138 && !savedthrown)
	invincible = false;
if (!invincible && alarm[5] < 0 && !flash)
	alarm[5] = 0.15 * room_speed;
if ((state == 276 || (state == 104 && attackspeed >= 10) || (state == 74 && sprite_index == spr_fakepeppino_flailing)) && alarm[4] < 0)
{
	alarm[4] = 10;
	if (state == 108)
		alarm[4] = 5;
}
mask_index = spr_pizzahead_idle;
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
scr_pizzaface_p3_update_sounds();
