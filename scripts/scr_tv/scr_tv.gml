function tv_set_idle()
{
	with (obj_tv)
	{
		state = 0;
		sprite_index = spr_tv_idle;
	}
}
function tv_reset()
{
	with (obj_tv)
	{
		state = 0;
		sprite_index = spr_tv_idle;
		ds_list_clear(tvprompts_list);
	}
}
function tv_create_prompt()
{
	return [argument0, argument1, argument2, argument3];
}
function tv_push_prompt()
{
	with (obj_tv)
	{
		var b = [argument0, argument1, argument2, argument3];
		var play = false;
		switch (argument1)
		{
			case 0:
				play = true;
				ds_list_insert(tvprompts_list, 0, b);
				break;
			case 1:
				var placed = false;
				for (var i = 0; i < ds_list_size(tvprompts_list); i++)
				{
					var b2 = ds_list_find_value(tvprompts_list, i);
					if (b2[1] == 2)
					{
						if (i == 0)
							play = true;
						ds_list_insert(tvprompts_list, i, b);
						placed = true;
						break;
					}
				}
				if (!placed)
					ds_list_add(tvprompts_list, b);
				break;
			case 2:
				ds_list_add(tvprompts_list, b);
				break;
		}
		if (play)
			state = 0;
	}
}
function tv_push_prompt_array()
{
	for (var i = 0; i < array_length(argument0); i++)
	{
		with (obj_tv)
		{
			var b = argument0[i];
			tv_push_prompt(b[0], b[1], b[2], b[3]);
		}
	}
}
function tv_push_prompt_once()
{
	with (obj_tv)
	{
		if (special_prompts == -4)
		{
			return false;
		}
		var b = ds_map_find_value(special_prompts, argument1);
		if (is_undefined(b))
		{
			return false;
		}
		if (b != 1)
		{
			tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3]);
			ds_map_set(special_prompts, argument1, 1);
			ini_open_from_string(obj_savesystem.ini_str);
			ini_write_real("Prompts", argument1, 1);
			obj_savesystem.ini_str = ini_close();
			return true;
		}
		return false;
	}
}
function tv_default_condition()
{
	return place_meeting(x, y, obj_player);
}
function tv_do_expression()
{
	with (obj_tv)
	{
		if (expressionsprite != argument0 && bubblespr == -4)
		{
			state = 250;
			expressionsprite = argument0;
			switch expressionsprite
            {
                case spr_tv_exprhurt:
                case spr_tv_hurtG:
                    expressionbuffer = 60
                    break
                case spr_tv_exprhurt1:
                case spr_tv_exprhurt2:
                case spr_tv_exprhurt3:
                case spr_tv_exprhurt4:
                case spr_tv_exprhurt5:
                case spr_tv_exprhurt6:
                case spr_tv_exprhurt7:
                case spr_tv_exprhurt8:
                case spr_tv_exprhurt9:
                case spr_tv_exprhurt10:
                    expressionbuffer = 100
                    break
                case spr_tv_exprcollect:
                    expressionbuffer = 150
                    if obj_player.isgustavo
                    {
                        expressionsprite = spr_tv_happyG
                        if (irandom(100) <= 50)
                            fmod_event_one_shot_3d("event:/sfx/voice/brickok", obj_player1.x, obj_player1.y)
                    }
                    if (irandom(100) <= 50)
                        scr_fmod_soundeffect(obj_player1.snd_voiceok, obj_player1.x, obj_player1.y)
                    break;
            }
		}
	}
}
function scr_tv_get_transfo_sprite()
{
	var _state = obj_player1.state;
	if (_state == 84 || _state == 61)
		_state = obj_player1.tauntstoredstate;
	var _spr = noone;
	switch (_state)
	{
		case 47:
		case 48:
		case 49:
		case 38:
			_spr = spr_tv_knight;
			break;
		case 51:
		case 52:
			_spr = spr_tv_bombpep;
			break;
		case 9:
			_spr = spr_tv_fireass;
			if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2)
				_spr = spr_tv_scaredjump;
			break;
		case 5:
			if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
				_spr = spr_tv_tumble;
			else if (obj_player1.shotgunAnim)
				_spr = spr_tv_shotgun;
			break;
		case 10:
			_spr = spr_tv_firemouth;
			break;
		case 16:
		case 17:
			_spr = spr_tv_ghost;
			break;
		case 59:
			if (obj_player1.sprite_index == obj_player1.spr_squished)
				_spr = spr_tv_squished;
			break;
		case 0:
		case states.jump:
		case 42:
		case 100:
		case 93:
		case 121:
		case 105:
		case 106:
			with (obj_player1)
			{
				if (shotgunAnim)
					_spr = spr_tv_shotgun;
				else if (global.mort)
					_spr = spr_tv_mort;
			}
			break;
		case states.freefallprep:
		case states.freefall:
		case states.freefallland:
			if (obj_player1.shotgunAnim)
				_spr = spr_tv_shotgun;
			break;
		case 72:
			if (global.mort)
				_spr = spr_tv_mort;
			break;
		case 66:
		case 69:
		case 71:
		case 57:
		case 70:
		case 67:
		case 68:
			_spr = spr_tv_shotgun;
			break;
		case 113:
		case 114:
		case 116:
		case 115:
			_spr = spr_tv_barrel;
			break;
		case states.golf:
			_spr = spr_tv_golf;
			break;
		case 184:
		case 185:
			_spr = spr_tv_rocket;
			break;
		case 21:
			_spr = spr_tv_cheeseball;
			break;
		case 24:
		case 26:
		case 25:
		case 29:
		case 30:
			_spr = spr_tv_cheesepep;
			break;
		case 33:
		case 35:
		case 34:
			_spr = spr_tv_boxxedpep;
			break;
		case 31:
			_spr = spr_tv_weenie;
			break;
		case 11:
		case 13:
		case 14:
		case 12:
			_spr = spr_tv_mort;
			break;
		case states.mach2:
		case 37:
		case 65:
		case 78:
			if (obj_player1.skateboarding)
				_spr = spr_tv_clown;
			else if (obj_player1.shotgunAnim)
				_spr = spr_tv_shotgun;
			break;
	}
	with (obj_player1)
	{
		if (state == 146 && sprite_index == spr_tumble)
			_spr = spr_tv_tumble;
	}
	return _spr;
}
