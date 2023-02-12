if (room == rm_editor)
	exit;
targetplayer = obj_player1.id;
wastedhits = 8 - elitehit;
if (elitehit <= 1 && pizzahead)
	destroyable = true;
switch (state)
{
	case 144:
		scr_noise_arenaintro();
		break;
	case states.walk:
		scr_noise_walk();
		break;
	case 104:
		scr_noise_mach2();
		break;
	case 105:
		scr_noise_machslide();
		break;
	case 92:
		scr_noise_jump();
		break;
	case 170:
		scr_noise_jetpackstart();
		break;
	case 171:
		scr_noise_jetpack();
		break;
	case 127:
		scr_noise_bounce();
		break;
	case 58:
		scr_noise_pogo();
		break;
	case 271:
		scr_noise_dropstart();
		break;
	case 272:
		scr_noise_drop();
		break;
	case 284:
		scr_noise_droptrap();
		break;
	case 148:
		scr_noise_golf();
		break;
	case 108:
		scr_noise_freefall();
		break;
	case 283:
		scr_noise_noisecrusher();
		break;
	case 244:
		scr_noise_spin();
		break;
	case 286:
		scr_noise_noiseballooncrash();
		break;
	case 273:
		scr_noise_phase1hurt();
		break;
	case 295:
		scr_noise_fightball();
		break;
	case 80:
		scr_vigilante_punch();
		break;
	case 289:
		scr_noise_finale();
		break;
	case 298:
		scr_boss_pizzaheadKO();
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
	case 294:
		scr_boss_pizzaheadjump();
		break;
	case 154:
		scr_enemy_pummel();
		break;
	case states.staggered:
		scr_enemy_staggered();
		break;
}
if (sprite_index == spr_playerN_fightball)
{
	if (fightball_buffer1 > 0)
		fightball_buffer1--;
	else
	{
		fightball_buffer1 = 20 + irandom(8);
		repeat (irandom(4) + 1)
			instance_create(x + irandom_range(-60, 60), y + irandom_range(-20, 60), obj_gusbrickcloud);
	}
	if (fightball_buffer2 > 0)
		fightball_buffer2--;
	else
	{
		fightball_buffer2 = 8 + irandom(5);
		with (create_debris(x, y, spr_slapstar))
			vsp = -irandom_range(5, 10);
		with (create_debris(x, y, spr_baddiegibs))
			vsp = -irandom_range(5, 10);
	}
}
boss_update_pizzaheadKO(spr_bossfight_noiseHP, spr_bossfight_noisepalette);
with (obj_noisey)
{
	var t = id;
	if (thrown && (place_meeting(x + hsp, y, other) || place_meeting(x, y, other)))
	{
		with (other)
			scr_noise_do_hurt(t);
	}
}
boss_hurt_gustavo();
if (droptrap && (state == 134 || state == 138))
{
	if (abs(x - targetplayer.x) <= 200)
	{
		droptrap = false;
		state = 284;
		sprite_index = spr_noise_copyexplode;
		image_index = 0;
	}
}
if (wastedhits >= 8 && phase == 1 && !pizzahead)
{
	elitehit = 8;
	wastedhits = 0;
	phase = 2;
	ballooncrash = true;
	flickertime = 0;
	cooldown = 20;
	avaiblemoves = [];
	skateboardhit = 0;
	jetpackhit = 0;
	pogohit = 0;
	hotairhit = 0;
	destroyable = true;
	scr_sleep(25);
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
if (prevhp != elitehit)
{
	if (elitehit < prevhp)
	{
		pizzahead_subhp = pizzahead_maxsubhp;
		if (irandom(100) <= 25)
			fmod_event_one_shot_3d("event:/sfx/voice/noisenegative", x, y);
		avaiblemoves = [];
		if (lastattack == 0)
			skateboardhit += 1;
		if (lastattack == 1)
			jetpackhit += 1;
		if (lastattack == 2)
			pogohit += 1;
		if (lastattack == 3)
			hotairhit += 1;
		boss_do_pizzaheadKO();
		if (pizzahead && elitehit <= 2 && !pizzaheadshot)
			pizzaheadshot = true;
		cooldown = 0;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		alarm[6] = 5;
		global.playerhit++;
		pogobomb = false;
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -32, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if ((state == 134 || (state == 138 && !savedthrown)) && flickertime <= 0 && (wastedhits != 7 || pizzahead))
	invincible = false;
else
	invincible = true;
if (instance_exists(obj_noiseballooncrash))
	invincible = true;
if (state == 298)
	invincible = true;
if (pizzahead)
{
	with (obj_gustavograbbable)
	{
		if (enemy_is_superslam(id) || enemy_is_swingding(id))
			other.invincible = true;
	}
}
if ((!invincible || ((state == 134 && flickertime <= 0) || (state == 138 && !savedthrown))) && !flash && alarm[5] < 0)
	alarm[5] = 0.15 * room_speed;
else if (invincible && (state != 134 || flickertime > 0) && (state != 138 || savedthrown))
	flash = false;
if ((state == 104 || state == 105 || state == 171 || state == 127 || state == 58) && alarm[4] < 0)
	alarm[4] = 5;
mask_index = spr_player_mask;
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
scr_noise_update_sounds();
