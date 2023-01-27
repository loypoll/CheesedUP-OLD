targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 530;
if (hp <= 0 && state != 145)
{
	if (!destroyed && !thrown && !destroyable)
		boss_destroy(lastplayerid);
}
switch (state)
{
	case 145:
		grav = 0.5;
		state_boss_arenaround();
		break;
	case 0:
		grav = 0.5;
		boss_mrstick_normal();
		break;
	case 174:
		grav = 0.5;
		boss_mrstick_shield();
		break;
	case 175:
		grav = 0.5;
		boss_mrstick_helicopterhat();
		break;
	case 176:
		grav = 0.5;
		boss_mrstick_panicjump();
		break;
	case 92:
		grav = 0.5;
		boss_mrstick_jump();
		break;
	case 177:
		grav = 0.5;
		boss_mrstick_smokebombstart();
		break;
	case 178:
		grav = 0.5;
		boss_mrstick_smokebombcrawl();
		break;
	case 179:
		grav = 0.5;
		boss_mrstick_springshoes();
		break;
	case 180:
		grav = 0.5;
		boss_mrstick_cardboard();
		break;
	case 181:
		grav = 0.5;
		boss_mrstick_cardboardend();
		break;
	case 182:
		grav = 0.5;
		boss_mrstick_mockery();
		break;
	case 134:
		grav = 0.5;
		state_boss_walk(boss_mrstick_decide_attack);
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
colliding = !(state == 92 || state == 180 || state == 181);
