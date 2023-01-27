function string_split()
{
	argument0 += " ";
	var _current_str = "";
	var _list = [0];
	for (var i = 1; i < (string_length(argument0) + 1); i++)
	{
		var _char = string_char_at(argument0, i);
		if (_char != argument1)
			_current_str += _char;
		else
		{
			array_push(_list, _current_str);
			_current_str = "";
		}
	}
	return _list;
}
function function_overload(argument0, func)
{
	var _size = array_length(argument0);
	switch (_size - 1)
	{
		case -1:
			func();
			break;
		case 0:
			func(argument0[0]);
			break;
		case 1:
			func(argument0[0], argument0[1]);
			break;
		case 2:
			func(argument0[0], argument0[1], argument0[2]);
			break;
		case 3:
			func(argument0[0], argument0[1], argument0[2], argument0[3]);
			break;
		case 4:
			func(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4]);
			break;
		case 5:
			func(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4], argument0[5]);
			break;
		case 6:
			func(argument0[0], argument0[1], argument0[2], argument0[3], argument0[4], argument0[5], argument0[6]);
			break;
	}
}
function DebugCommand() constructor
{
	command_id = argument0;
	description = argument1;
	format = argument2;
	func = argument3;
	Invoke = function()
	{
		if (argument0 != undefined)
			function_overload(argument0, func);
		else
			func();
	};
}
function TextList_Add()
{
	with (obj_debugcontroller)
	{
		if (DEBUG)
			ds_list_add(text_list, [argument0, argument1]);
	}
}
