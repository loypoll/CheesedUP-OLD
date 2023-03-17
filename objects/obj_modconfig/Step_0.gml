if live_call() return live_result;
scr_getinput();

key_back = safe_get(obj_option, "key_back") or key_slap2;

// go back
if key_back
{
	for(var i = 0; i < array_length(options_array); i++)
	{
		var opt = options_array[i];
		if opt.type == 0
			variable_global_set(opt.vari, opt.opts[opt.value][1]);
	}
	
	if instance_exists(obj_option)
		obj_option.backbuffer = 2;
	with create_transformation_tip("{u}Settings saved!/")
	{
		depth = -700;
		alarm[1] = 100;
	}
	sound_play(sfx_back);
	instance_destroy();
}

// move
var move = key_down2 - key_up2;
if move != 0
{
	sound_play(sfx_step);
	simuplayer.state = states.titlescreen;
	
	sel += move;
	if sel >= array_length(options_array)
		sel = 1;
}

// figure section
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	if opt.type == 1
	{
		if sel == i
		{
			sel += move;
			if sel < 0
				sel = array_length(options_array) - 1;
		}
		if sel >= i
			section = i;
	}
}

// change values
var move2 = key_left2 + key_right2;
if move2 != 0
{
	var opt = options_array[sel];
	
	var valueold = opt.value;
	opt.value = clamp(opt.value + move2, 0, array_length(opt.opts) - 1);
	
	if valueold != opt.value
		sound_play(sfx_step);
}
if key_jump
{
	sound_play(sfx_select);
	var opt = options_array[sel];
	opt.value = wrap(opt.value + 1, 0, array_length(opt.opts) - 1);
}
