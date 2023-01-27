if (room == rm_editor)
	exit;
if (!instance_exists(cloneid))
	cloneid = -4;
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
		image_alpha = 1;
		scr_enemy_stun();
		break;
	case 129:
		image_alpha = 1;
		scr_pizzagoblin_throw();
		break;
	case 4:
		image_alpha = 1;
		scr_enemy_grabbed();
		break;
	case 141:
		scr_enemy_chase();
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
if (state != 141 && image_alpha >= 1)
	scr_scareenemy();
if (bombreset > 0)
	bombreset--;
if (sprite_index == scaredspr)
{
	image_alpha = 1;
	attacking = false;
}
if (bombreset == 0 && state == 134)
{
	attacking = false;
	targetplayer = global.coop ? instance_nearest(x, y, obj_player) : 530;
	if ((targetplayer.x > (x - threshold_x) && targetplayer.x < (x + threshold_x)) && (y <= (targetplayer.y + threshold_y) && y >= (targetplayer.y - threshold_y)))
	{
		attacking = true;
		pos = sign(x - targetplayer.x);
		state = 141;
		fade = true;
	}
}
if (state == 141)
{
	if (fade)
	{
		if (image_alpha > 0)
		{
			if (hsp < -0.2 || hsp > 0.2)
				hsp *= 0.5;
			image_alpha -= fadeout_time;
		}
		else if (image_alpha <= 0)
		{
			x = targetplayer.x;
			y = targetplayer.y;
			if (pos != 0 && !scr_solid(x + (pos * attack_offset), y))
			{
				x = targetplayer.x + (pos * attack_offset);
				if (place_meeting(x, y, obj_pickle))
				{
					if (!scr_solid(x + 32, y))
						x += 32;
					else if (!scr_solid(x - 32, y))
						x -= 32;
				}
			}
			if (!scr_solid(x, y + 1))
			{
				var yy = y;
				var ground = false;
				for (var i = 1; i < ground_check; i++)
				{
					if (scr_solid(x, y + i))
					{
						ground = true;
						i--;
						yy = y + i;
						break;
					}
				}
				if (ground)
					y = yy;
			}
			fade = false;
		}
	}
	else
	{
		if (image_alpha < 1)
			image_alpha += fadein_time;
		if (image_alpha >= 1)
		{
			image_alpha = 1;
			image_index = 0;
			sprite_index = spr_pickle_attack;
			fmod_event_one_shot_3d("event:/sfx/enemies/pickledance", x, y);
			var old_xscale = image_xscale;
			image_xscale = -sign(x - targetplayer.x);
			if (image_xscale == 0)
				image_xscale = old_xscale;
			state = 129;
			if (elite && cloneid == -4)
			{
				var tx = image_xscale * 32;
				if (scr_solid(x + tx, y))
					tx = 0;
				cloneid = instance_create(x + tx, y, obj_pickle);
				with (cloneid)
				{
					cloneid = other.id;
					important = true;
					bombreset = 0;
					image_index = 0;
					image_xscale = other.image_xscale;
					state = 129;
					hsp = other.image_xscale * 2;
					vsp = -6;
				}
				flash = true;
				alarm[4] = 5;
				create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale);
			}
		}
	}
}
invincible = attacking;
if (state == 126)
{
	if (scaredbuffer > 0 && attacking)
	{
		image_alpha = 0.8;
		invincible = true;
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
