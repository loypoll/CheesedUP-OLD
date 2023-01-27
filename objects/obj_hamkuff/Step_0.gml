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
	case 134:
		break;
	case 206:
		if (!instance_exists(playerid))
		{
			state = 134;
			break;
		}
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
	case 125:
		scr_enemy_rage();
		break;
	case 17:
		scr_enemy_ghostpossess();
		break;
}
if (state == 138 && stunned > 100 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 134 && state != 206)
	attract_player = false;
var _dis = 300;
if (state == 134 && obj_player1.isgustavo && !obj_player1.cutscene && obj_player1.state != 292 && obj_player1.state != 119 && ((distance_to_object(obj_player) < _dis && obj_player1.brick) || distance_to_object(obj_ratmountgroundpound) < _dis || (distance_to_object(obj_brickcomeback) < _dis && instance_exists(obj_brickcomeback) && !obj_brickcomeback.trapped) || distance_to_object(obj_brickball) < _dis))
{
	state = 206;
	sprite_index = spr_hamkuff_chain1;
	var x1 = obj_player1.x;
	var y1 = obj_player1.y;
	if (instance_exists(obj_ratmountgroundpound))
	{
		x1 = obj_ratmountgroundpound.x;
		y1 = obj_ratmountgroundpound.y;
	}
	else if (instance_exists(obj_brickcomeback))
	{
		x1 = obj_brickcomeback.x;
		y1 = obj_brickcomeback.y;
	}
	else if (instance_exists(obj_brickball))
	{
		x1 = obj_brickball.x;
		y1 = obj_brickball.y;
	}
	with (instance_create(x1, y1, obj_parryeffect))
		sprite_index = spr_morthookgrabeffect;
	instance_destroy(obj_ratmountgroundpound, false);
	instance_destroy(obj_brickcomeback, false);
	instance_destroy(obj_brickball, false);
	with (instance_create(x1, y1, obj_brickcomeback))
	{
		trapped = true;
		baddieID = other.id;
		other.playerid = id;
	}
	with (obj_player1)
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/hamkuffgrab", other.x, other.y);
		fmod_event_one_shot_3d("event:/sfx/rat/ratdead", x, y);
		fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
		brick = false;
		sprite_index = spr_lonegustavo_idle;
		state = 191;
	}
}
if (state != 138)
	birdcreated = false;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
