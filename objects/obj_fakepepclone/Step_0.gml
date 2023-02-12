targetplayer = obj_player1.id;
mask_index = spr_player_mask;
switch (state)
{
	case 8:
		scr_fakepepclone_transitioncutscene();
		break;
	case states.walk:
		scr_fakepepclone_walk();
		break;
	case 276:
		scr_fakepepboss_grabdash();
		break;
	case 277:
		scr_fakepepboss_grabthrow();
		break;
	case 92:
		scr_fakepepboss_jump();
		break;
	case 108:
		scr_fakepepboss_freefall();
		break;
	case 104:
		scr_fakepepboss_mach2();
		break;
	case 99:
		scr_fakepepclone_Sjumpprep();
		break;
	case 97:
		scr_fakepepclone_Sjump();
		break;
	case 74:
		scr_fakepepclone_throwing();
		break;
	case 84:
		scr_fakepepboss_backbreaker();
		break;
}
if (state == 97)
{
	if (!instance_exists(hitboxID))
	{
		with (instance_create(x, y, obj_forkhitbox))
		{
			ID = other.id;
			other.hitboxID = id;
			sprite_index = other.sprite_index;
		}
	}
}
if ((state == 276 || (state == 104 && attackspeed >= 10) || (state == 74 && sprite_index == spr_fakepeppino_flailing) || state == 108) && alarm[0] == -1)
{
	alarm[0] = 10;
	if (state == 108)
		alarm[0] = 5;
}
if (state == 92)
	grav = 0.4;
else
	grav = 0.5;
scr_collide();
scr_fakepep_update_sounds();
