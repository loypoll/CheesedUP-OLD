event_inherited();
attack_pool[0] = [42, 92];
attack_pool[1] = [77, 167];
attack_pool[2] = [42, 74, 168];
attack_pool[3] = [58, 169];
attack_pool[4] = [170, 172, 173];
attack_pool[5] = [42, 92, 77, 167, 74, 168, 58, 169, 170, 172, 173];
attack_pool[6] = [42, 92, 77, 167];
attack_pool[7] = [42, 74, 168, 58, 169];
attack_pool[8] = [170, 172, 173];
attack_type[42] = [1, 1];
attack_type[92] = [3, 1];
attack_type[77] = [2, 2];
attack_type[167] = [3, 3];
attack_type[74] = [3, 3];
attack_type[168] = [2, 2];
attack_type[58] = [3, 3];
attack_type[169] = [3, 3];
attack_type[170] = [3, 3];
attack_type[172] = [3, 3];
attack_type[173] = [1, 1];
current_behaviour = 0;
current_attack = 42;
state = 145;
ds_map_set(player_hurtstates, 42, 30000);
ds_map_set(player_hurtstates, 41, 50);
ds_map_set(player_hurtstates, 104, 20);
ds_map_set(player_hurtstates, 121, 30);
ds_map_set(boss_hurtstates, 80, 30);
ds_map_set(boss_hurtstates, 42, 30);
ds_map_set(boss_hurtstates, 102, 30);
ds_map_set(boss_hurtstates, 77, 60);
ds_map_set(boss_hurtstates, 58, 30);
ds_map_set(boss_hurtstates, 171, 80);
ds_map_set(boss_hurtstates, 173, 80);
phase = 1;
max_phase = 9;
max_hp = 500 * max_phase;
hp = max_hp;
stunfallspr = spr_playerN_hurt;
walkspr = spr_playerN_move;
idlespr = spr_playerN_idle;
spr_dead = spr_playerN_hurt;
tauntspr = spr_playerN_taunt;
fallspr = spr_playerN_fall;
bumpspr = spr_playerN_bump;
parryspr = spr_playerN_spin;
defeatplayerspr = spr_playerN_spin;
movespeed = 0;
move = 0;
normal_spd = 6;
changeside_spd = 10;
slide = false;
slidejump = 0;
skateboard_turns = 0;
bombkick = false;
bombpogo = false;
pogochargeactive = false;
pogospeedprev = false;
pogomach = false;
pogospeed = 0;
jetpackcancel = false;
fakedeath = true;
angry = true;
spin_count = 0;
slideskateboard = false;
spinskateboard = false;
bombcount = 0;
jumpcount = 0;
pogo_buffer = 0;
pogo_max = 240;
pogo_random = 4;
spin_buffer = 0;
spin_max = 18;
chooseparry_max[0] = 480;
chooseparry_max[1] = 420;
chooseparry_max[2] = 360;
chooseparry_max[3] = 300;
chooseparry_max[4] = 300;
chooseparry_max[5] = 300;
chooseparry_max[6] = 300;
chooseparry_max[7] = 300;
chooseparry_max[8] = 300;
chooseparry_random = 4;
chooseparry_buffer = chooseparry_max[phase - 1];
taunt_buffer = 0;
taunt_max = 25;
attack_max[0] = 25;
attack_max[1] = 25;
attack_max[2] = 25;
attack_max[3] = 25;
attack_max[4] = 25;
attack_max[5] = 25;
attack_max[6] = 25;
attack_max[7] = 25;
attack_max[8] = 25;
attack_cooldown = attack_max[0];
dashcloudid = -4;
targetstunned = 0;
targetstunnedminus[0] = 30;
targetstunnedminus[1] = 30;
targetstunnedminus[2] = 30;
targetstunnedminus[3] = 30;
targetstunnedminus[4] = 30;
targetstunnedminus[5] = 30;
targetstunnedminus[6] = 30;
targetstunnedminus[7] = 30;
targetstunnedminus[8] = 30;
function boss_destroy()
{
	SUPER_boss_destroy(argument0);
	targetstunned = 1000;
	stunned = 1000;
	if (fakedeath)
	{
		angry = true;
		fakedeath = false;
		destroyable = false;
		with (obj_bosscontroller)
		{
			alarm[1] = room_speed * 4;
			fakedeath = true;
			state = 8;
			depth = other.depth + 1;
		}
	}
	else
	{
		global.noisecutscene2 = true;
		quick_ini_write_real(get_savefile_ini(), "cutscene", "noise2", true);
	}
}
function boss_hurt()
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[phase - 1];
		attack_cooldown = 0;
		boss_noise_decide_attack();
		if (targetstunned < 0)
			targetstunned = 1;
	}
	else
		targetstunned = 150;
	var ps = state;
	SUPER_boss_hurt(argument0, argument1);
	if (ps == 58)
		movespeed = 0;
	targetxscale = -argument1.xscale;
}
function boss_hurt_noplayer()
{
	if (targetstunned > 0)
	{
		targetstunned -= targetstunnedminus[phase - 1];
		attack_cooldown = 0;
		if (targetstunned < 0)
			targetstunned = 1;
	}
	else
		targetstunned = 150;
	SUPER_boss_hurt_noplayer(argument0);
}
function player_hurt()
{
	if (!argument1.inv_frames && (argument1.state != 84 || argument1.parry_inst == -4))
	{
		hitstate = state;
		hithsp = hsp;
		hitvsp = vsp;
		SUPER_player_hurt(argument0, argument1);
		with (argument1)
		{
			inv_frames = true;
			alarm[1] = 15;
		}
		if (hitstate == 77 || hitstate == 171)
		{
			stunned = (hitstate == 77) ? 30 : 70;
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			hitstate = 138;
			movespeed = 0;
			hitvsp = -4;
			hithsp = -image_xscale * 8;
		}
	}
}
