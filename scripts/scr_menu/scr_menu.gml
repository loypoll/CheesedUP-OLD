function menu_goto()
{
	menu = 0;
	for (var i = 0; i < array_length(menus); i++)
	{
		var b = menus[i];
		if (b.menu_id == argument0)
		{
			menu = i;
			break;
		}
	}
	optionselected = 0;
}
function create_menu_fixed()
{
	return 
	{
		menu_id: argument0,
		type: 0,
		anchor: argument1,
		xpad: argument2,
		ypad: argument3,
		options: []
	};
}
function add_option_press()
{
	var b = 
	{
		option_id: argument1,
		type: 2,
		func: argument3,
		name: argument2
	};
	array_push(argument0.options, b);
	return b;
}
function add_option_toggle()
{
	if (argument3 == undefined)
		argument3 = -4;
	var b = 
	{
		option_id: argument1,
		type: 0,
		value: false,
		name: argument2,
		on_changed: argument3
	};
	array_push(argument0.options, b);
	return b;
}
function add_option_multiple()
{
	if (argument4 == undefined)
		argument4 = -4;
	var b = 
	{
		option_id: argument1,
		type: 1,
		values: argument3,
		value: 0,
		name: argument2,
		on_changed: argument4
	};
	array_push(argument0.options, b);
	return b;
}
function create_option_value()
{
	if (argument2 == undefined)
		argument2 = true;
	return 
	{
		name: argument0,
		value: argument1,
		localization: argument2
	};
}
function add_option_slide()
{
	if (argument3 == undefined)
		argument3 = -4;
	if (argument4 == undefined)
		argument4 = -4;
	if (argument5 == undefined)
		argument5 = -4;
	var b = 
	{
		option_id: argument1,
		type: 3,
		value: 100,
		moved: false,
		name: argument2,
		on_changed: argument4,
		on_move: argument3,
		slidecount: 0,
		moving: false,
		sound: -4
	};
	if (argument5 != -4)
		b.sound = fmod_event_create_instance(argument5);
	array_push(argument0.options, b);
	return b;
}
