if (room == rm_editor)
	exit;
targetplayer = obj_player1.id;
wastedhits = 9 - elitehit;
if (pizzahead && elitehit <= 1)
	destroyable = true;
switch (state)
{
	case 144:
		scr_vigilante_arenaintro();
		break;
	case 134:
		scr_vigilante_walk();
		break;
	case 1:
		scr_vigilante_revolver();
		break;
	case 269:
		scr_vigilante_reloading();
		break;
	case 104:
		scr_vigilante_mach2();
		break;
	case 102:
		scr_vigilante_crouchslide();
		break;
	case 2:
		scr_vigilante_dynamite();
		break;
	case 74:
		scr_vigilante_throwing();
		break;
	case 270:
		scr_vigilante_estampede();
		break;
	case 273:
		scr_vigilante_phase1hurt();
		break;
	case 274:
		scr_vigilante_duel();
		break;
	case 80:
		scr_vigilante_punch();
		break;
	case 92:
		scr_vigilante_jump();
		break;
	case 278:
		scr_vigilante_wait();
		break;
	case 279:
		scr_vigilante_flamethrower();
		break;
	case 280:
		scr_vigilante_machinegun();
		break;
	case 281:
		scr_vigilante_bazooka();
		break;
	case 282:
		scr_vigilante_crate();
		break;
	case 294:
		scr_boss_pizzaheadjump();
		break;
	case 298:
		scr_boss_pizzaheadKO();
		break;
	case 137:
		scr_vigilante_hit();
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
	case 155:
		scr_enemy_staggered();
		break;
	case 262:
		if (elitehit <= 0)
			destroyable = true;
		break;
}
boss_update_pizzaheadKO(25, 1708);
if (state != 279 && flameID != -4)
{
	instance_destroy(obj_flamethrowerhurtbox);
	flameID = -4;
}
if (state == 1 || state == 278 || state == 2 || state == 74 || state == 270)
{
	if (targetplayer.x != x)
		image_xscale = -sign(x - targetplayer.x);
}
boss_hurt_gustavo();
if (!pizzahead && obj_player1.state != 146 && obj_player1.state != 61 && obj_player1.state != 262 && !obj_player1.instakillmove && obj_player1.y >= (y - 20) && obj_player1.state != 293 && state != 137 && state != 138 && state != 273 && state != 262 && hsp == 0)
{
	if (place_meeting(x, y, obj_player1))
	{
		with (obj_player)
		{
			if (state != 91)
			{
				var ix = (x > (room_width / 2)) ? 1 : -1;
				xscale = ix;
				sprite_index = spr_bump;
				hsp = -xscale * 5;
				movespeed = abs(hsp);
				vsp = -3;
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
	instance_destroy(bossvulnerableID);
	currentattack = 0;
	if (elitehit < prevhp && (wastedhits != 10 || destroyable))
	{
		if (irandom(100) <= 25)
			fmod_event_one_shot_3d("event:/sfx/voice/vigiduel", x, y);
		pizzahead_subhp = pizzahead_maxsubhp;
		reposition = true;
		oldspotID = -4;
		if (place_meeting(x, y, obj_vigilantespot))
			oldspotID = instance_place(x, y, obj_vigilantespot);
		bullethit = 0;
		cooldown = 0;
		touchedground = false;
		hsp += (-image_xscale * 5);
		flickertime = 11;
		alarm[6] = 5;
		global.playerhit++;
		boss_do_pizzaheadKO();
		if (pizzahead && elitehit <= 2 && !pizzaheadshot)
			pizzaheadshot = true;
		if (!pizzahead && elitehit < 5)
			instance_create_unique(0, 0, 175);
		if (global.playerhit >= 3)
		{
			global.playerhit = 0;
			instance_create(obj_player1.x, -15, obj_hppickup);
		}
	}
	prevhp = elitehit;
}
if (((phase == 1 && elitehit <= 0) || (phase == 2 && elitehit <= 0)) && !pizzahead)
{
	if (phase == 1)
	{
		instance_destroy(obj_johnecheese);
		instance_destroy(obj_johnecheese_spawner);
		instance_destroy(obj_targetguy);
		instance_destroy(obj_vigilantecow);
		instance_destroy(obj_vigilantecrate);
		elitehit = 9;
		wastedhits = 0;
		phase = 2;
		scr_sleep(25);
		fmod_event_one_shot_3d("event:/sfx/voice/vigiangry", x, y);
		var lay1 = layer_get_id("Backgrounds_Ring");
		var lay2 = layer_get_id("Backgrounds_2");
		var lay3 = layer_get_id("Backgrounds_1");
		var bg1 = layer_background_get_id(lay1);
		var bg2 = layer_background_get_id(lay2);
		alarm[7] = 5;
		layer_set_visible(lay3, true);
		layer_background_change(bg2, 3814);
		layer_background_change(bg1, 23);
		with (obj_drawcontroller)
		{
			use_dark = true;
			dark_alpha = 1;
		}
	}
	else if (phase == 2 && state != 274 && state != 137 && !thrown)
	{
		instance_destroy(obj_johnecheese);
		instance_destroy(obj_johnecheese_spawner);
		fmod_event_one_shot_3d("event:/sfx/voice/vigiduel", x, y);
		if (!destroyable)
		{
			state = 274;
			hsp = 0;
			vsp = 0;
			sprite_index = spr_playerV_idle;
			flickertime = 0;
			playerhit--;
			touchedground = false;
			alarm[6] = -1;
			var dis = 264;
			image_xscale = -1;
			x = room_width - dis;
			y = 402;
			instance_create(0, 0, obj_vigilante_duelintro);
			duelphase = 0;
			duelbuffer = 140;
			duelplayer = false;
			signspr = spr_preparetodraw;
			signy = -sprite_get_height(signspr);
			fmod_event_one_shot("event:/sfx/voice/vigiduel");
			instance_destroy(obj_vigilantecrate);
			instance_destroy(obj_vigilantebazooka);
			instance_destroy(obj_vigilantebazookatrail);
			instance_destroy(obj_vigilantecow);
			instance_destroy(obj_cowspawner);
			instance_destroy(obj_cowstampede);
			instance_destroy(obj_cowfall);
			instance_destroy(obj_uziprojectile);
			instance_destroy(obj_vigilantedynamite);
			instance_destroy(obj_vigilanteshot);
			instance_destroy(obj_ladderhorizontal);
			with (obj_player1)
			{
				pistolanim = -4;
				state = 274;
				hsp = 0;
				vsp = 0;
				xscale = 1;
				sprite_index = spr_idle;
				x = dis;
				y = 402;
			}
		}
		else
			instance_destroy();
	}
}
if (state == 138)
{
	if (wastedhits >= 7 && sprite_index == spr_pepperman_shoulderhurt && grounded && vsp > 0 && !thrown && stunned > 10)
		stunned = 1;
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
if (state != 274)
	signy = Approach(signy, -sprite_get_height(signspr), 20);
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state == 269 || (state == 138 && savedthrown == thrown && !savedthrown))
	invincible = false;
else
	invincible = true;
if (wastedhits == 4 && phase == 1)
	invincible = true;
if (state == 298)
	invincible = true;
if (pizzahead && state == 138 && !thrown && alarm[5] == -1 && !flash)
	alarm[5] = 0.15 * room_speed;
if (state == 102 && alarm[4] < 0)
{
	alarm[4] = 10;
	if (state == 108)
		alarm[4] = 5;
}
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
scr_vigilante_update_sounds();
