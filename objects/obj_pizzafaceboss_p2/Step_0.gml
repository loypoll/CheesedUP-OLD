targetplayer = obj_player1.id;
image_speed = 0.35;
wastedhits = 8 - elitehit;
switch (state)
{
	case 135:
		scr_pizzaface_p2_fall();
		break;
	case states.walk:
		scr_pizzaface_p2_normal();
		break;
	case 233:
		scr_pizzaface_p2_fishing();
		break;
	case 232:
		scr_pizzaface_p2_look();
		break;
	case 240:
		boss_pizzahead_pullinglevel();
		break;
	case states.throwing:
		boss_pizzahead_throwing();
		break;
	case 237:
		boss_pizzahead_portraitthrow();
		break;
	case 66:
		boss_pizzahead_shotgun();
		break;
	case 293:
		boss_pizzahead_pinup();
		break;
	case states.boss_phase1hurt:
		boss_pizzahead_p2_phase1hurt();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
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
}
if (obj_player1.state != 146 && obj_player1.y >= (y - 20) && obj_player1.state != 293 && state != 137 && state != 138 && state != 273 && hsp == 0 && state != 135)
{
	if ((x > (room_width / 2) && obj_player1.x >= (x - 60)) || (x <= (room_width / 2) && obj_player1.x <= (x + 60)))
	{
		with (obj_player)
		{
			if (state != 91)
			{
				var ix = (x > (room_width / 2)) ? 1 : -1;
				xscale = ix;
				sprite_index = spr_bump;
				hsp = -xscale * 8;
				movespeed = abs(hsp);
				vsp = -7;
				state = 91;
				grounded = false;
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				instance_create(x, y, obj_bumpeffect);
			}
		}
	}
}
if (prevhp != elitehit)
{
	if (elitehit < prevhp)
	{
		instance_destroy(obj_pizzaheadswordstone);
		if (lastattack != -1 && lastattack != 4)
			movecount[lastattack] += 1;
		bullethit = 0;
		if (elitehit <= 0)
			instance_destroy();
		global.playerhit++;
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
		if (wastedhits >= 3 && elitehit > 0)
			instance_create_unique(room_width / 2, -200, obj_pizzahead_haywire);
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
if (state == 138 && savedthrown == thrown && !savedthrown)
	invincible = false;
else
	invincible = true;
if (state == 230 && alarm[4] < 0)
	alarm[4] = 6;
mask_index = spr_pizzahead_idle;
if (state == 138 && thrown)
{
	while (place_meeting(x, y, obj_solid))
		y--;
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
scr_pizzaface_p2_update_sounds();
