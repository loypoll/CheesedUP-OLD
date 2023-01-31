function add_music(argument0, argument1, argument2, argument3, argument4 = noone)
{
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
function hub_state(argument0, argument1, argument2)
{
	var s = 0;
	switch (argument0)
	{
		 case tower_1:
        case tower_1up:
        case tower_cheftask1:
        case tower_johngutterhall:
        case tower_ruinsecret:
            s = 0
            break
        case tower_2:
        case tower_2up:
        case tower_cheftask2:
        case tower_ravine:
            s = 1
            break
        case tower_3:
        case tower_3up:
        case tower_cheftask3:
        case tower_pizzaland:
            s = 2
            break
        case tower_4:
        case tower_4up:
        case tower_cheftask4:
        case tower_graffiti:
        case tower_noisettecafe:
            s = 3
            break
        case tower_5:
        case tower_cheftask5:
        case tower_laundryroom:
        case tower_mansion:
            s = 4
            break
	}
	fmod_event_instance_set_parameter(argument1, "hub", s, false);
}
function music_get_pos_wrap(argument0, argument1)
{
	while (argument0 > argument1)
		argument0 -= argument1;
	if (argument0 < 1)
		argument0 = 1;
	return argument0;
}
