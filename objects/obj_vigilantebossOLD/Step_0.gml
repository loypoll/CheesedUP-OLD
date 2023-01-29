targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (hp <= 0 && state != 145 && state != 162)
{
	if (!thrown && !destroyable)
		boss_destroy(lastplayerid);
}
if ((state == 103 || state == 105 || state == 102 || state == 82 || state == 80 || state == 166 || state == 42) && alarm[0] <= 0)
	alarm[0] = 6;
if (chooseparry_buffer > 0)
	chooseparry_buffer--;
if (important && honor && nexthonor && phase > 3 && state != 160)
{
	var ch = false;
	with (obj_player)
	{
		if (state == 41)
			ch = true;
	}
	if (instance_exists(obj_shotgunbullet) || ch)
	{
		nexthonor = false;
		with (obj_tv)
		{
			showtext = true;
			message = "NO HONOR";
			alarm[0] = 200;
		}
	}
}
switch (phase)
{
	case 4:
	case 5:
	case 6:
		normal_func = boss_vigilante_normal_phase4;
		break;
	default:
		normal_func = boss_vigilante_normal;
}
switch (state)
{
	case 145:
		grav = 0.5;
		state_boss_arenaround();
		honor = nexthonor;
		break;
	case 0:
		grav = 0.5;
		normal_func();
		break;
	case 149:
		grav = 0.5;
		boss_vigilante_float();
		break;
	case 1:
		grav = 0.5;
		boss_vigilante_revolver();
		break;
	case 103:
		grav = 0.5;
		boss_vigilante_mach1();
		break;
	case 102:
		grav = 0.5;
		boss_vigilante_crouchslide();
		break;
	case 105:
		grav = 0.5;
		boss_vigilante_machslide();
		break;
	case 106:
		grav = 0.5;
		state_boss_bump();
		break;
	case 92:
		grav = 0.5;
		boss_vigilante_jump();
		break;
	case 2:
		grav = 0.5;
		boss_vigilante_dynamite();
		break;
	case 128:
		grav = 0.5;
		boss_vigilante_charge();
		break;
	case 80:
		grav = 0.5;
		boss_vigilante_punch();
		break;
	case 164:
		grav = 0.5;
		boss_vigilante_groundpunchstart();
		break;
	case 122:
		grav = 0.5;
		boss_vigilante_freefallprep();
		break;
	case 108:
		grav = 0.5;
		boss_vigilante_freefall();
		break;
	case 111:
		grav = 0.5;
		boss_vigilante_freefallland();
		break;
	case 166:
		grav = 0.5;
		boss_vigilante_millionpunch();
		break;
	case 82:
		grav = 0.5;
		boss_vigilante_uppunch();
		break;
	case 42:
		grav = 0.5;
		boss_vigilante_handstandjump();
		break;
	case 158:
		grav = 0.5;
		boss_vigilante_superattackstart();
		break;
	case 160:
		grav = 0.5;
		boss_vigilante_superattack();
		break;
	case 134:
		grav = 0.5;
		state_boss_walk(boss_vigilante_decide_attack);
		inv_timer = 2;
		invincible = true;
		break;
	case 61:
		grav = 0.5;
		state_boss_chainsaw();
		break;
	case 84:
		grav = 0.5;
		state_boss_taunt();
		invincible = true;
		inv_timer = 2;
		break;
	case 147:
		grav = 0.5;
		state_boss_parry();
		invincible = true;
		inv_timer = 2;
		normalattack_cooldown = normalattack_max[phase - 1];
		break;
	case 137:
		grav = 0.5;
		scr_enemy_hit();
		stunned = targetstunned;
		break;
	case 138:
		grav = 0.5;
		state_boss_stun();
		break;
}
if (hitstate == 160 || state == 160)
{
	with (lastplayerid)
	{
		if (state != 137 && state != 156)
		{
			if (sprite_index == spr_player_pistolshot && image_index > (image_number - 1))
				sprite_index = spr_player_pistolidle;
			if (sprite_index != spr_player_pistolshot && sprite_index != spr_idle && other.state == 160 && other.duel_buffer > 0)
				sprite_index = spr_idle;
		}
	}
}
attacking = state == 1 || state == 103 || state == 128 || state == 80 || state == 164 || state == 166 || state == 108 || state == 82 || state == 42 || state == 160 || state == 158 || state == 102;
