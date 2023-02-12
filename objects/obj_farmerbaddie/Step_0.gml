if (room == rm_editor)
	exit;
switch (state)
{
	case 126:
		scr_enemy_idle();
		break;
	case 130:
		scr_enemy_turn();
		break;
	case states.walk:
		if (!idle)
			scr_enemy_walk();
		else
		{
			sprite_index = idlespr;
			hsp = Approach(hsp, 0, 1);
		}
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
	case 17:
		scr_enemy_ghostpossess();
		break;
}
if (bombreset > 0)
	bombreset--;
scr_scareenemy();
if (state != 134 && object_index != obj_farmerbaddie2 && object_index != obj_farmerbaddie3)
	idle = false;
if (state == 134)
{
	var x1 = disx;
	playerid = instance_nearest(x, y, obj_player);
	var t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100);
	if (cooldown > 0)
		cooldown--;
	else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
	{
		state = 92;
		sprite_index = ragespr;
		vsp = -5;
		hsp = 0;
		if (playerid.x != x)
			image_xscale = sign(playerid.x - x);
	}
}
else if (state == 92)
{
	if (grounded && vsp > 0)
	{
		fmod_event_instance_play(chargesnd);
		fmod_event_instance_set_3d_attributes(chargesnd, x, y);
		state = 128;
		sprite_index = ragespr;
		attackspeed = 6;
	}
}
else if (state == 128)
{
	idle = false;
	if (object_index != obj_farmerbaddie3 && !instance_exists(hitboxID))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
			other.hitboxID = id;
		}
	}
	x1 = disx_out;
	playerid = instance_nearest(x, y, obj_player);
	t = playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400);
	hsp = image_xscale * attackspeed;
	var q = outofsight;
	if (!t || collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
		outofsight = true;
	if (t)
		outofsight = false;
	if (outofsight)
	{
		if (q != outofsight)
			waitbuffer = 30;
		if (waitbuffer > 0)
			waitbuffer--;
		else
			attackspeed = Approach(attackspeed, 0, 0.1);
	}
	else
		attackspeed = Approach(attackspeed, attackmaxspeed, 1);
	if (attackspeed <= 0)
	{
		cooldown = 60;
		state = 134;
		sprite_index = walkspr;
	}
	if (place_meeting(x + hsp, y, obj_solid) && !place_meeting(x + hsp, y, obj_slope))
		image_xscale *= -1;
}
if (state != 128 && hitboxID != -4 && instance_exists(hitboxID))
{
	instance_destroy(hitboxID);
	hitboxID = -4;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
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
