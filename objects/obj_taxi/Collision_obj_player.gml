with (other)
{
	if (key_up && grounded && ((state == 191 && brick) || state == 0 || state == 103 || state == 104 || state == 58 || state == 121 || state == 99) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_taxidud) && !instance_exists(obj_fadeout) && state != 119 && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
	{
		with (other)
		{
			instance_create(x, y, obj_genericpoofeffect);
			obj_player1.visible = false;
			obj_player1.sprite_index = obj_player1.spr_idle;
			obj_player1.hsp = 0;
			obj_player1.movespeed = 0;
			obj_player1.ratmount_movespeed = 0;
			obj_player1.vsp = 0;
			obj_player1.state = 119;
			fmod_event_one_shot("event:/sfx/misc/taximove");
			playerid = 530;
			move = true;
			sprite_index = spr_taximove;
			hsp = 10;
			obj_player1.cutscene = true;
			depth = -100;
			if (police)
			{
				with (instance_create(x, y, obj_taxicardboard))
					depth = -101;
				fmod_event_one_shot("event:/sfx/misc/policesiren");
				police_buffer = 50;
				obj_player1.policetaxi = true;
				sprite_index = spr_taxicop;
			}
			if (global.coop == 1)
			{
				obj_player2.sprite_index = obj_player2.spr_idle;
				fmod_event_one_shot("event:/sfx/misc/taximove");
				playerid = 529;
				sprite_index = spr_taximove;
				hsp = 10;
				obj_player2.visible = false;
				obj_player2.hsp = 0;
				obj_player2.vsp = 0;
				obj_player2.state = 119;
				obj_player2.cutscene = true;
			}
		}
	}
}
