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
		break;
	case 136:
		scr_enemy_land();
		break;
	case 137:
		scr_enemy_hit();
		break;
	case 138:
		scr_enemy_stun();
		break;
	case 129:
		scr_pizzagoblin_throw();
		break;
	case 4:
		scr_enemy_grabbed();
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
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 4)
	depth = 0;
if (state != 128)
	scr_scareenemy();
if (sprite_index == spr_ancho_chargestart && floor(image_index) == (image_number - 1))
{
	if (hitboxcreate == 0 && state == 128)
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_forkhitbox))
			ID = other.id;
	}
	sprite_index = spr_ancho_charge;
	movespeed = 10;
}
var player = instance_nearest(x, y, obj_player);
if (ragebuffer > 0)
	ragebuffer--;
if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 60) && y >= (player.y - 60)) && important == 0)
{
	if (state != 125 && ragebuffer == 0 && elite && (state == 134 || state == 128))
	{
		state = 125;
		sprite_index = spr_ancho_rage1;
		if (x != player.x)
			image_xscale = -sign(x - player.x);
		ragebuffer = 100;
		image_index = 0;
		image_speed = 0.5;
		flash = true;
		alarm[4] = 5;
		with (instance_create(x, y, obj_forkhitbox))
		{
			sprite_index = spr_bighitbox;
			mask_index = spr_bighitbox;
			ID = other.id;
		}
		create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
	else if (x != player.x && state != 128 && y == ystart && important == 0)
	{
		if (state == 134)
		{
			fmod_event_instance_play(chargesnd);
			fmod_event_instance_set_3d_attributes(chargesnd, x, y);
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
			state = 128;
			sprite_index = spr_ancho_chargestart;
		}
	}
}
if (state == 138 || state == 134)
	movespeed = 0;
if (state == 126 && sprite_index == scaredspr)
	vsp = 0;
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
