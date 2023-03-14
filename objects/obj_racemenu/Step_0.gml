if live_call() return live_result;

function roomname_text(str, t = 80)
{
	instance_destroy(obj_transfotip);
	with instance_create(0, 0, obj_transfotip)
	{
		text = "{s}" + str + "/";
		alarm[1] = t;
	}
}

switch menu
{
	case 0:
		var moveh = obj_player1.key_right2 + obj_player1.key_left2;
		if moveh != 0
		{
			var prevsel = sel;
			sel = clamp(sel + moveh, 0, 1);
			if sel != prevsel
				sound_play(sfx_step)
		}
		break;
	
	case 1:
		var movev = (obj_player1.key_down2 - obj_player1.key_up2) + keyboard_check_pressed(vk_tab);
		if movev != 0
		{
			var prevsel = sel;
			sel = clamp(sel + movev, 0, 3);
			
			if sel != prevsel
			{
				sound_play(sfx_step);
				switch sel
				{
					case 0: keyboard_string = string(obj_onlineclient.ip); break;
					case 1: keyboard_string = string(obj_onlineclient.port); break;
					case 2: keyboard_string = string(obj_onlineclient.username); break;
				}
			}
		}
		
		switch sel
		{
			case 0:
				var strout = "";
				for(var i = 1; i <= min(string_length(keyboard_string), 32); i++)
				{
					var ch = string_char_at(keyboard_string, i);
					/*
					if ch == "." && string_char_at(keyboard_string, i - 1) == "."
					{
						roomname_text("DOT AFTER DOT IS HARAM...");
						break;
					}
					if (ord(ch) >= ord(0) && ord(ch) <= ord(9)) or ch == "."
					*/
						strout += ch;
					/*else
					{
						roomname_text("ONLY NUMBERS AND DOTS!");
						break;
					}*/
				}
				keyboard_string = strout;
				obj_onlineclient.ip = keyboard_string;
				break;
			
			case 1:
				keyboard_string = string_digits(keyboard_string);
				if keyboard_string != "" && real(keyboard_string) > 65535
				{
					keyboard_string = "65535";
					roomname_text("The maximum port is 65535!");
				}
				obj_onlineclient.port = keyboard_string;
				break;
			
			case 2:
				keyboard_string = string_lettersdigits(keyboard_string);
				if string_length(keyboard_string) > 24
				{
					keyboard_string = string_copy(keyboard_string, 1, 24);
					roomname_text("Username too long!");
				}
				obj_onlineclient.username = keyboard_string;
				break;
			
			case 3:
				if obj_player1.key_slap2
				{
					sound_play(sfx_enemyprojectile);
					instance_destroy(obj_onlineclient);
					menu = 0;
					sel = 0;
				}
				else if obj_player1.key_jump or keyboard_check_pressed(vk_enter)
				{
					if obj_onlineclient.username == ""
					{
						sound_play(sfx_bumpwall);
						roomname_text("You need an username!");
					}
					else if obj_onlineclient.port == ""
					{
						sound_play(sfx_bumpwall);
						roomname_text("You need a port!");
					}
					else if obj_onlineclient.ip == ""
					{
						sound_play(sfx_bumpwall);
						roomname_text("You need an IP!");
					}
					else
					{
						sound_play(sfx_step);
						menu = 3;
						with obj_onlineclient
							event_user(1);
					}
				}
				break;
		}
		break;
	
	case 3:
		if obj_onlineclient.connected
		{
			sound_play(sfx_collecttoppin);
			menu = -1;
		}
		break;
	
	case 4:
		sound_play(sfx_bumpwall);
		roomname_text("Connection failed!", room_speed * 5);
		menu = 1;
		break;
	
	case 2:
		var movev = (obj_player1.key_down2 - obj_player1.key_up2) + keyboard_check_pressed(vk_tab);
		if movev != 0
		{
			var prevsel = sel;
			sel = clamp(sel + movev, 0, 2);
			
			if sel != prevsel
			{
				sound_play(sfx_step);
				switch sel
				{
					case 0: keyboard_string = string(obj_onlinehost.port); break;
					case 1: keyboard_string = string(obj_onlinehost.max_clients); break;
				}
			}
		}
		
		switch sel
		{
			case 0:
				keyboard_string = string_digits(keyboard_string);
				if keyboard_string != "" && real(keyboard_string) > 65535
				{
					keyboard_string = "65535";
					roomname_text("Maximum port is 65535!");
				}
				obj_onlinehost.port = keyboard_string;
				break;
			
			case 1:
				keyboard_string = string_digits(keyboard_string);
				if keyboard_string != ""
				{
					if real(keyboard_string) < 2
					{
						keyboard_string = "2";
						roomname_text("Can't have less than 2 players!");
					}
					if real(keyboard_string) > 16
					{
						keyboard_string = "16";
						roomname_text("Can't have more than 16 players!");
					}
				}
				obj_onlinehost.max_clients = keyboard_string;
				break;
			
			case 2:
				if obj_player1.key_slap2
				{
					sound_play(sfx_enemyprojectile);
					instance_destroy(obj_onlinehost);
					menu = 0;
					sel = 1;
				}
				else if obj_player1.key_jump or keyboard_check_pressed(vk_enter)
				{
					if obj_onlinehost.port == ""
					{
						sound_play(sfx_bumpwall);
						roomname_text("You need a port!");
					}
					else if obj_onlinehost.max_clients == ""
					{
						sound_play(sfx_bumpwall);
						roomname_text("You need a number of players!");
					}
					else
					{
						with obj_onlinehost
							event_user(1);
						if obj_onlinehost.server < 0
						{
							sound_play(sfx_bumpwall);
							roomname_text("Failed to make a server!");
						}
						else
						{
							sound_play(sfx_collecttoppin);
							menu = 5;
							
							ds_list_clear(consolelog);
							ds_list_add(consolelog, "Created server on port " + string(obj_onlinehost.port));
						}
					}
				}
				break;
		}
		break;
}
if menu == 5
	fmod_event_instance_set_parameter(obj_music.music.event, "state", 1, false);
else
	fmod_event_instance_set_parameter(obj_music.music.event, "state", 0, false);

with obj_shell
	WC_bindsenabled = !(other.menu == 1 or other.menu == 2);
