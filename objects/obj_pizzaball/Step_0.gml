if (room == rm_editor)
	exit;
if (state == 134 && grounded && vsp > 0 && obj_player.state == 111 && bbox_in_camera(view_camera[0], 32))
	scr_pizzaball_go_to_thrown(0, -10);
arrowindex += 0.35;
switch (state)
{
	case 126:
		scr_enemy_idle();
		break;
	case 130:
		scr_enemy_turn();
		break;
	case states.walk:
		scr_enemy_walk();
		break;
	case 136:
		scr_enemy_land();
		break;
	case 137:
		scr_pizzaball_hit();
		break;
	case 148:
		scr_pizzaball_golf();
		break;
	case 156:
		scr_pizzaball_thrown();
		break;
	case 138:
		scr_enemy_stun();
		if (stunned > 0)
			stunned -= 1;
		break;
	case 129:
		scr_pizzagoblin_throw();
		break;
	case 4:
		scr_pizzaball_grabbed();
		break;
	case 154:
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
if (state != 148)
{
	shootup = false;
	arrow = false;
}
if (state == 156)
{
	if (blur_effect > 0)
		blur_effect--;
	else
	{
		blur_effect = 2;
		with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
			playerid = other.id;
	}
}
if ((state == 134 || state == 126) && sit)
{
	hsp = 0;
	sprite_index = spr_pizzaball_idle1;
}
if (state != 134)
	sit = false;
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state == 156 && !instance_exists(pointerID))
{
	pointerID = instance_create(x, y, obj_objecticontracker);
	pointerID.sprite_index = spr_icon_pizzaball;
	pointerID.objectID = id;
}
if (state != 138)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (bigcheeseID != -4)
{
	if (!instance_exists(bigcheeseID) || bigcheeseID.state != 74 || bigcheeseID.shot)
	{
		if (instance_exists(bigcheeseID) && bigcheeseID.object_index == obj_golfburger && sprite_index == stunfallspr)
			sprite_index = walkspr;
		bigcheeseID = -4;
	}
	else
		invincible = true;
}
else
	invincible = false;
if (hitbuffer > 0)
{
	invincible = true;
	hitbuffer--;
}
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
if (state == 156)
{
	with (instance_place(x + xscale, y, obj_destructibles))
		instance_destroy();
	with (instance_place(x + hsp + xscale, y, obj_destructibles))
		instance_destroy();
	with (instance_place(x, y + vsp + 1, obj_destructibles))
		instance_destroy();
	with (instance_place(x, (y + vsp) - 1, obj_destructibles))
		instance_destroy();
	with (instance_place(x, y + 1, obj_destructibles))
		instance_destroy();
	with (instance_place(x, y - 1, obj_destructibles))
		instance_destroy();
}
