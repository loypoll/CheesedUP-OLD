if (room == rm_editor)
	exit;
switch (state)
{
	case 126:
		scr_enemy_idle();
		break;
	case 128:
		scr_enemy_charge();
		break;
	case 130:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		if (!instance_exists(coneID))
		{
			coneID = instance_create(x, y, obj_patrolcone);
			coneID.xoffset = 24;
			coneID.baddieID = id;
		}
		if (alarm[5] != -1)
			hsp = 0;
		break;
	case 136:
		scr_enemy_land();
		break;
	case states.hit:
		scr_enemy_hit();
		break;
	case states.stun:
		scr_enemy_stun();
		break;
	case 129:
		scr_pizzagoblin_throw();
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
	case 125:
		scr_enemy_rage();
		break;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 138)
	birdcreated = false;
if (state == 134 && y > ystart && !scr_solid(x, y - 1))
	y--;
if (state == 134 && y < ystart && !scr_solid(x, y + 1))
	y++;
if (state == 138)
	grav = 0.5;
else
	grav = 0;
if (cooldown > 0)
	cooldown--;
if (state == 134)
{
	if (!patrolfound)
	{
		if (!instance_exists(obj_jumpscare) && cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
		{
			patroltimer = patroltimermax;
			patrolfound = true;
			alarm[5] = 30;
		}
	}
	else if (alarm[5] == -1)
		alarm[5] = 30;
}
else if (state == 138 || state == 4 || state == 137)
	alarm[5] = -1;
if (instance_exists(obj_jumpscare))
{
	patrolfound = false;
	alarm[5] = -1;
}
if (state == 134 && point_in_camera(x, y, view_camera[0]))
{
	var p = false;
	with (obj_player)
	{
		if (state == 84 && sprite_index == spr_taunt)
			p = true;
	}
	if (p)
	{
		patroltimer = 0;
		alarm[5] = 1;
	}
}
if (state == 80)
{
	hsp = 0;
	if (floor(image_index) == (image_number - 1))
	{
		state = 134;
		sprite_index = walkspr;
		cooldown = 100;
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 4)
	depth = 0;
if (state == 138 || state == 134)
	movespeed = 0;
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
