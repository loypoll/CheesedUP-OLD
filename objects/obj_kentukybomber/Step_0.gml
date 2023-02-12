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
if (bombreset > 0 && state == 134)
	bombreset--;
var player = instance_nearest(x, y, obj_player);
if (ragebuffer > 0)
	ragebuffer--;
if ((player.x > (x - 200) && player.x < (x + 200)) && (player.y <= (y + 400) && player.y >= (y - 60)))
{
	if (x != player.x && state != 129 && bombreset == 0)
	{
		if (state == 134)
		{
			sprite_index = spr_kentukybomber_attack;
			image_index = 0;
			state = 129;
		}
	}
}
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state == 129 || state == 125)
{
	hsp = 0;
	vsp = 0;
}
if (state != 4)
	depth = 0;
scr_scareenemy();
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
