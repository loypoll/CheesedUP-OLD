if (room == rm_editor)
	exit;
switch (state)
{
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
	case 125:
		scr_enemy_rage();
		break;
	case 189:
		var player = instance_nearest(x, y, obj_player);
		hsp = 0;
		if (underground)
		{
			if (vsp < 0)
				vsp = 0;
			sprite_index = spr_minijohn_underground;
			visible = false;
			if (player.x > (x - 80) && player.x < (x + 80) && y <= (player.y + 60) && y >= (player.y - 60) && (player.state == 111 || player.sprite_index == player.spr_piledriverland))
			{
				fmod_event_one_shot_3d("event:/sfx/enemies/treasureguy", x, y);
				notification_push(13, [room, object_index, id]);
				underground = false;
				visible = true;
				if (player.x != x)
					image_xscale = sign(x - player.x);
				sprite_index = spr_treasureguy_stun;
				vsp = -4;
				repeat (3)
					create_debris(x, y, 1494);
			}
		}
		else if (grounded && vsp > 0)
		{
			state = 134;
			sprite_index = idlespr;
		}
		break;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state == 138 && thrown)
	sprite_index = stunfallspr;
if (state != 138)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
if (state == 134)
{
	sprite_index = walkspr;
	hsp = 0;
}
if (state == 126)
{
	if (sprite_index == scaredspr)
	{
		if (image_index > (image_number - 1))
			state = 141;
	}
	else
	{
		sprite_index = spr_treasureguy_idle;
		image_speed = 0.35;
	}
}
if (state != 126 && state != 189 && state != 4 && state != 137 && state != 138 && state != 141 && !running)
{
	if ((x < (targetplayer.x + threshold_x) && x > (targetplayer.x - threshold_x)) && (y < (targetplayer.y + threshold_y) && y > (targetplayer.y - threshold_y)))
	{
		state = 126;
		image_index = 0;
		sprite_index = scaredspr;
		scaredbuffer = scared_max;
		if (x != targetplayer.x)
			image_xscale = sign(x - targetplayer.x);
	}
}
if (state == 141)
{
	image_speed = 0.5;
	if (hsp != 0)
		sprite_index = spr_treasureguy_escape;
	else
		sprite_index = spr_treasureguy_escape;
	if (runmovespeed < runmovespeed_max)
		runmovespeed += accel;
	else
		runmovespeed = runmovespeed_max;
	hsp = image_xscale * runmovespeed;
	if (grounded)
	{
		if (scr_solid(x + sign(hsp), y) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y - 4, obj_slope)))
		{
			if (!jumped)
			{
				vsp = -11;
				jumped = true;
			}
			else
			{
				runmovespeed = 0;
				image_xscale *= -1;
				jumped = false;
			}
		}
		else
			jumped = false;
	}
	if (distance_to_object(targetplayer) > idle_threshold)
		state = 134;
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
if (state == 189)
{
	invincible = true;
	if (sprite_index != spr_minijohn_underground && sprite_index != spr_minijohn_undergroundout)
		image_blend = c_gray;
}
else
{
	invincible = false;
	image_blend = c_white;
}
