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
}
if (state == 138 && stunned > 40 && birdcreated == 0)
{
	birdcreated = true;
	with (instance_create(x, y, obj_enemybird))
		ID = other.id;
}
if (state != 138)
	birdcreated = false;
idlespr = spr_cheeserobot_idle;
stunfallspr = spr_cheeserobot_stun;
walkspr = spr_cheeserobot_walk;
stunspr = spr_cheeserobot_stun;
grabbedspr = spr_cheeserobot_stun;
if (flash == 1 && alarm[2] <= 0)
	alarm[2] = 0.15 * room_speed;
if (hp <= 0)
	instance_destroy();
if (state != 4)
	depth = 0;
if (state != 138)
	thrown = false;
if (bombreset > 0)
	bombreset--;
if (x != obj_player.x && state != 129 && bombreset == 0)
{
	if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && (y <= (obj_player.y + 20) && y >= (obj_player.y - 20)))
	{
		if (state == 134 || state == 126)
		{
			image_index = 0;
			image_xscale = -sign(x - obj_player.x);
			state = 129;
		}
	}
}
