function add_music()
{
	if (argument4 == undefined)
		argument4 = -4;
	var b = 
	{
		continuous: argument3,
		on_room_start: -4,
		value: 0,
		immediate: false,
		event: -4,
		event_secret: -4
	};
	with (b)
	{
		if (argument4 != -4)
			on_room_start = method(self, argument4);
		if (argument1 != -4)
		{
			event_name = argument1;
			event = fmod_event_create_instance(argument1);
		}
		if (argument2 != -4)
		{
			event_secret_name = argument2;
			event_secret = fmod_event_create_instance(argument2);
		}
	}
	ds_map_set(music_map, argument0, b);
	return b;
}
function stop_music()
{
	with (obj_music)
	{
		if (music != -4)
		{
			if (obj_pause.pause)
			{
				fmod_event_instance_stop(music.event, true);
				fmod_event_instance_stop(music.event_secret, true);
			}
			else
			{
				fmod_event_instance_stop(music.event, false);
				fmod_event_instance_stop(music.event_secret, false);
			}
		}
		fmod_event_instance_stop(pillarmusicID, true);
		fmod_event_instance_stop(panicmusicID, true);
	}
}
function hub_state()
{
	var s = 0;
	switch (argument0)
	{
		case 756:
		case 777:
		case 814:
		case 803:
		case 809:
			s = 0;
			break;
		case 752:
		case 778:
		case 815:
		case 810:
			s = 1;
			break;
		case 748:
		case 780:
		case 816:
		case 811:
			s = 2;
			break;
		case 744:
		case 781:
		case 817:
		case 812:
		case 808:
			s = 3;
			break;
		case 740:
		case 818:
		case 807:
		case 813:
			s = 4;
			break;
	}
	fmod_event_instance_set_parameter(argument1, "hub", s, false);
}
function music_get_pos_wrap()
{
	while (argument0 > argument1)
		argument0 -= argument1;
	if (argument0 < 1)
		argument0 = 1;
	return argument0;
}
