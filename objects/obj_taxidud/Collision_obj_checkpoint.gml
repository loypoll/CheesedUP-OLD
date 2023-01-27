if (playerid.visible == 0)
{
	global.hp = 8;
	global.failcutscene = false;
	with (obj_player1)
	{
		fmod_event_one_shot("event:/sfx/misc/taxibeep");
		state = 0;
		instance_create(x, y, obj_genericpoofeffect);
		cutscene = false;
		if (isgustavo)
		{
			state = 191;
			sprite_index = spr_player_ratmountidle;
		}
	}
	if (global.coop == 1)
	{
		with (obj_player2)
		{
			state = 0;
			cutscene = false;
			if (isgustavo)
				state = 191;
		}
	}
	obj_player1.visible = true;
	obj_player2.visible = true;
}
