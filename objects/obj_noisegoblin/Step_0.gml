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
scr_scareenemy();
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
if (bombreset > 0)
	bombreset--;
targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (sprite_index == spr_archergoblin_shoot && x != targetplayer.x)
	image_xscale = -sign(x - targetplayer.x);
if (x != targetplayer.x && targetplayer.state != 51 && state != 129 && bombreset == 0 && grounded)
{
	if ((targetplayer.x > (x - 200) && targetplayer.x < (x + 200)) && (y <= (targetplayer.y + 200) && y >= (targetplayer.y - 200)))
	{
		if (state == 134 || (state == 126 && sprite_index != scaredspr))
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/noisegoblinbow");
			sprite_index = spr_archergoblin_shoot;
			image_index = 0;
			if (x != targetplayer.x)
				image_xscale = -sign(x - targetplayer.x);
			state = 129;
		}
	}
}
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
