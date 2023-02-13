targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 530;
if (obj_bosscontroller.state == 144)
	exit;
if (hp <= 0 && state != 145 && state != 162)
{
	if (!thrown && !destroyable)
		boss_destroy(lastplayerid);
}
image_speed = 0.35;
if (knightbuffer > 0)
	knightbuffer--;
switch (phase)
{
	case 0:
		normal_func = boss_pizzaface_phase1normal;
		break;
	case 1:
		normal_func = boss_pizzahead_phase2normal;
		break;
	case 2:
		normal_func = boss_pizzahead_phase3normal;
		break;
}
switch (state)
{
	case 145:
		grav = 0.5;
		break;
	case 0:
		grav = 0.5;
		normal_func();
		break;
	case states.pizzaface_ram:
		grav = 0.5;
		boss_pizzaface_ram();
		break;
	case 226:
		grav = 0.5;
		boss_pizzaface_moustache();
		break;
	case 228:
		grav = 0.5;
		boss_pizzaface_eyes();
		break;
	case 227:
		grav = 0.5;
		boss_pizzaface_mouth();
		break;
	case 229:
		grav = 0.5;
		boss_pizzaface_nose();
		break;
	case 231:
		boss_pizzaface_phase2transition();
		break;
	case states.pizzahead_look:
		boss_pizzahead_look();
		break;
	case states.pizzahead_fishing:
		boss_pizzahead_fishing();
		break;
	case 235:
		boss_pizzahead_bombrun();
		break;
	case 236:
		boss_pizzahead_npcthrow();
		break;
	case states.pizzahead_portraitthrow:
		boss_pizzahead_portraitthrow();
		break;
	case 238:
		boss_pizzahead_enguarde();
		break;
	case 239:
		boss_pizzahead_sexypicture();
		break;
	case states.pizzahead_pullinglevel:
		boss_pizzahead_pullinglevel();
		break;
	case 241:
		boss_pizzahead_eat();
		break;
	case 242:
		boss_pizzahead_surprisebox();
		break;
	case 243:
		boss_pizzahead_spinningrun();
		break;
	case states.pizzahead_spinningkick:
		boss_pizzahead_spinningkick();
		break;
	case 245:
		boss_pizzahead_spinningpunch();
		break;
	case 246:
		boss_pizzahead_groundpunch();
		break;
	case 247:
		boss_pizzahead_bigkick();
		break;
	case 248:
		boss_pizzahead_slamhead();
		break;
	case 249:
		boss_pizzahead_slamhead2();
		break;
	case states.walk:
		grav = 0.5;
		if (grounded)
			state = 0;
		invincible = true;
		inv_timer = 2;
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
		stunned = 30;
		break;
	case states.stun:
		grav = 0.5;
		state_boss_stun();
		break;
}
if (phase == 0 && state != 230)
	invincible = true;
else
	invincible = false;
attacking = state == 230 || state == 229 || state == 244 || state == 245 || state == 246 || state == 248 || state == 249;
colliding = state != 230;
if (phase > 0)
{
	mask_index = spr_pizzahead_giddy;
	stunfallspr = spr_pizzahead_giddy;
	walkspr = spr_pizzahead_giddy;
}
