targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (obj_bosscontroller.state == states.arenaintro)
	exit;
if (hp <= 0 && state != states.arenaround && state != states.boss_fistmatch)
{
	if (!thrown && !destroyable)
		boss_destroy(lastplayerid);
}
if (chooseparry_buffer > 0)
	chooseparry_buffer--;
switch (phase)
{
	case 1:
	case 2:
		normal_func = boss_pepperman_normal;
		break;
	case 3:
	case 4:
	case 5:
	case 6:
		normal_func = boss_pepperman_phase3normal;
		break;
}
switch (state)
{
	case states.arenaround:
		grav = 0.5;
		state_boss_arenaround();
		break;
	case states.normal:
		grav = 0.5;
		normal_func();
		break;
	case states.jump:
		grav = 0.5;
		boss_pepperman_jump();
		invincible = true;
		inv_timer = 2;
		break;
	case states.freefall:
		grav = 0.5;
		boss_pepperman_freefall();
		break;
	case states.freefallland:
		grav = 0.5;
		boss_pepperman_freefallland();
		break;
	case states.freefallprep:
		grav = 0.5;
		boss_pepperman_freefallprep();
		break;
	case states.shoulderbash:
		grav = 0.5;
		boss_pepperman_shoulderbash();
		break;
	case states.boss_supershoulderbash:
		grav = 0.5;
		boss_pepperman_supershoulderbash();
		break;
	case states.boss_superattackstart:
		grav = 0.5;
		boss_pepperman_superattackstart();
		break;
	case states.boss_superattackcharge:
		grav = 0.5;
		boss_pepperman_superattackcharge();
		break;
	case states.superslam:
		grav = 0.5;
		boss_pepperman_superslam();
		break;
	case states.boss_fistmatch:
		grav = 0.5;
		boss_pepperman_fistmatch();
		break;
	case states.boss_fistmatchend:
		grav = 0.5;
		boss_pepperman_fistmatchend();
		break;
	case states.shoulder:
		grav = 0.5;
		boss_pepperman_shoulder();
		break;
	case states.boss_shoulderturn:
		grav = 0.5;
		boss_pepperman_shoulderturn();
		break;
	case states.walk:
		grav = 0.5;
		state_boss_walk(boss_pepperman_decide_attack);
		invincible = true;
		inv_timer = 2;
		break;
	case states.charge:
		grav = 0.5;
		boss_pepperman_charge();
		invincible = true;
		inv_timer = 2;
		break;
	case states.chainsaw:
		grav = 0.5;
		state_boss_chainsaw();
		break;
	case states.backbreaker:
		grav = 0.5;
		state_boss_taunt();
		invincible = true;
		inv_timer = 2;
		break;
	case states.parry:
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
xscale = image_xscale;
colliding = !(state == states.superslam || state == states.boss_fistmatch || state == states.boss_superattackstart || state == states.boss_superattackcharge);
attacking = (state == (153 << 0) || state == (108 << 0) || state == (122 << 0) || state == (157 << 0) || state == (83 << 0) || state == (76 << 0) || state == (162 << 0) || state == (158 << 0) || state == (159 << 0) || state == (134 << 0));
