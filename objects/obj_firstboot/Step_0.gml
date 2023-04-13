if live_call() return live_result;

fade_alpha -= 0.1;

// restart the disclaimer if you turn on your internet
if net != os_is_network_connected(false)
	room_restart();

// animation
if state == 1
{
	t = Approach(t, 1, 0.06);
	size = animcurve_channel_evaluate(outback, t);
	
	if keyboard_check_pressed(ord("R"))
		room_restart();
}

// go
if state == 2
{
	if !are_you_sure // impossible
		instance_create(0, 0, obj_roomofdog);
	global.ANON_B007 = array_create(5, true);
	
	state = -1;
	room_goto(Realtitlescreen);
}
else if are_you_sure // impossible
	instance_create(0, 0, obj_roomofdog);

// drm
if GM_build_type != "run"
{
	if instance_exists(obj_roomofdog) && safe_get(obj_roomofdog, "hi") == undefined
		game_end();
	if !is_array(global.ANON_B007)
		instance_create(0, 0, obj_roomofdog);
	for(var i = 1; i < 5; i++)
	{
		if global.ANON_B007[i - 1] != global.ANON_B007[i]
		or (global.ANON_B007[i] != false && state != -1)
			instance_create(0, 0, obj_roomofdog);
	}
}
