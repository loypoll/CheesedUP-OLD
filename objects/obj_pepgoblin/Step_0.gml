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
	case 134:
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
	case 155:
		scr_enemy_staggered();
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
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
scr_scareenemy();
if (bombreset > 0)
	bombreset--;
var targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (x != targetplayer.x && state != 129 && obj_player.state != 5 && bombreset <= 0 && grounded)
{
	if ((targetplayer.x > (x - 80) && targetplayer.x < (x + 80)) && (y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100)))
	{
		if (state == 134)
		{
			image_index = 0;
			sprite_index = spr_pepgoblin_kick;
			image_xscale = -sign(x - targetplayer.x);
			state = 129;
		}
	}
}
if (grounded && state == 129 && floor(image_index) == 3)
	vsp = -5;
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
if (kickbuffer > 0)
{
	kickbuffer--;
	invincible = true;
}
else
	invincible = false;
