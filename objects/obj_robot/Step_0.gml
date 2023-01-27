destroyable = true;
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
	case 103:
		if (image_index > (image_number - 1))
		{
			hsp = image_xscale * startmachspeed;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				hsp += (_railinst.movespeed * _railinst.dir);
			}
			sprite_index = spr_robot_mach;
			image_index = 0;
			state = 104;
		}
		break;
	case 104:
		hsp = Approach(hsp, image_xscale * machspeed, 0.5) + railmovespeed;
		if (place_meeting(x, y + 1, obj_railparent))
		{
			_railinst = instance_place(x, y + 1, obj_railparent);
			railmovespeed = _railinst.movespeed * _railinst.dir;
		}
		else
			railmovespeed = 0;
		with (instance_place(x + hsp, y, obj_destructibles))
			instance_destroy();
		if (place_meeting(x + sign(hsp), y, obj_solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x, y, obj_destructibles))
		{
			fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
			state = 138;
			stunned = 100;
			vsp = -4;
			hsp = -image_xscale * 2;
			sprite_index = stunfallspr;
		}
		break;
	case 91:
		if (image_index > 8)
		{
			hsp = image_xscale * tacklespeed;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				_railinst = instance_place(x, y + 1, obj_railparent);
				hsp += (_railinst.movespeed * _railinst.dir);
			}
			with (instance_place(x + hsp, y, obj_destructibles))
				instance_destroy();
		}
		if (image_index > (image_number - 1))
		{
			state = 134;
			hsp = 0;
			railspeed = 0;
			sprite_index = walkspr;
		}
		if (place_meeting(x + sign(hsp), y, obj_solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x, y, obj_destructibles))
		{
			fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
			state = 138;
			stunned = 100;
			vsp = -8;
			hsp = -image_xscale * 5;
			sprite_index = stunfallspr;
		}
		break;
	case 23:
		hsp = 0;
		if (image_index > (image_number - 1))
		{
			state = 134;
			sprite_index = walkspr;
		}
		break;
}
if (elitehit <= 0 && state != 138)
	instance_destroy();
if (state == 138 && stunned > 40 && birdcreated == 0)
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
if (bombreset > 0)
	bombreset--;
targetplayer = instance_nearest(x, y, obj_player);
if (x != targetplayer.x && state != 129 && bombreset == 0)
{
	if ((targetplayer.x > (x - 400) && targetplayer.x < (x + 400)) && (y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20)))
	{
		if (state == 134 || (state == 126 && sprite_index != scaredspr))
		{
			fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
			image_index = 0;
			image_xscale = -sign(x - targetplayer.x);
			state = chosenstate;
			bombreset = 100;
			switch (state)
			{
				case 103:
					sprite_index = spr_robot_machstart;
					image_index = 0;
					image_speed = 0.6;
					hsp = 0;
					break;
				case 129:
					bombreset = 0;
					sprite_index = spr_robot_attack;
					image_index = 0;
					image_speed = 0.35;
					hsp = 0;
					break;
				case 91:
					sprite_index = spr_robot_tackle;
					image_index = 0;
					image_speed = 0.6;
					hsp = 0;
					break;
				case 23:
					sprite_index = spr_robot_slap;
					image_index = 0;
					image_speed = 0.6;
					hsp = 0;
					break;
			}
		}
	}
}
fmod_event_instance_set_3d_attributes(mach2snd, x + hsp, y + vsp);
fmod_event_instance_set_3d_attributes(tacklesnd, x + hsp, y + vsp);
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
if (state == 23 && image_index > 11)
{
	if (snd == 0)
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/robotslapsteam", x, y);
		fmod_event_instance_play("event:/sfx/enemies/minijohnpunch", x, y);
	}
	snd = true;
}
if (state == 104)
{
	if (snd == 0)
		fmod_event_instance_play(mach2snd);
	snd = true;
}
if (state == 91 && image_index > 8)
{
	if (snd == 0)
		fmod_event_instance_play(tacklesnd);
	snd = true;
}
if (state != 23 && state != 104 && state != 91)
	snd = false;
if (state == 104 || (state == 23 && image_index > 11) || (state == 91 && image_index > 8))
{
	if (!hitboxcreate)
	{
		hitboxcreate = true;
		with (instance_create(x, y, obj_forkhitbox))
		{
			if (other.state == 23)
				sprite_index = spr_swordhitbox;
			else if (other.state == 104 || other.state == 91)
				sprite_index = spr_bighitbox;
			ID = other.id;
		}
	}
}
else
	hitboxcreate = false;
