targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (hp <= 0 && state != 145)
{
	if (!destroyed && !thrown && !destroyable)
		boss_destroy(lastplayerid);
}
if (chooseparry_buffer > 0)
	chooseparry_buffer--;
if ((state == 42 || state == 102 || state == 167 || state == 171 || state == 173 || (state == 58 && pogochargeactive) || state == 77) && alarm[0] <= 0)
	alarm[0] = 6;
switch (state)
{
	case 145:
		grav = 0.5;
		state_boss_arenaround();
		movespeed = 0;
		inv_timer = 2;
		invincible = true;
		break;
	case 0:
		grav = 0.5;
		boss_noise_normal();
		break;
	case 106:
		grav = 0.5;
		state_boss_bump();
		break;
	case 42:
		grav = 0.5;
		boss_noise_handstandjump();
		break;
	case 102:
		grav = 0.5;
		boss_noise_crouchslide();
		break;
	case states.skateboard;
		grav = 0.5;
		boss_noise_skateboard();
		break;
	case states.boss_skateboardturn:
		grav = 0.5;
		boss_noise_skateboardturn();
		break;
	case states.jump:
		grav = 0.5;
		boss_noise_jump();
		break;
	case states.throwing:
		grav = 0.5;
		boss_noise_throwing();
		break;
	case 58:
		grav = 0.5;
		boss_noise_pogo();
		break;
	case states.boss_jetpackstart:
		grav = 0.5;
		boss_noise_jetpackstart();
		break;
	case states.boss_jetpack:
		grav = 0.5;
		boss_noise_jetpack();
		break;
	case 173:
		grav = 0.5;
		boss_noise_jetpackspin();
		break;
	case states.walk:
		grav = 0.5;
		state_boss_walk(boss_noise_do_attack);
		inv_timer = 2;
		invincible = true;
		break;
	case 61:
		grav = 0.5;
		state_boss_chainsaw();
		break;
	case states.backbreaker:
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
		break;
	case states.hit:
		grav = 0.5;
		scr_enemy_hit();
		stunned = targetstunned;
		break;
	case states.stun:
		grav = 0.5;
		state_boss_stun();
		break;
}
angry = phase > 6;
attacking = state == 42 || state == 102 || state == 77 || state == 167 || state == 58 || state == 170 || state == 171 || state == 173 || state == 74;
