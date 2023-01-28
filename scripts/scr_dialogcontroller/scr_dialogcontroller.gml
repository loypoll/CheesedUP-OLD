function scr_get_tutorial_key(char)
{
	var spr = -4;
	var ix = 0;
	var txt = -4;
	switch (char)
	{
		case 37:
			spr = spr_tutorialgamepad;
			ix = 16;
			break;
		case 39:
			spr = spr_tutorialgamepad;
			ix = 17;
			break;
		case 38:
			spr = spr_tutorialgamepad;
			ix = 4;
			break;
		case 40:
			spr = spr_tutorialgamepad;
			ix = 5;
			break;
		case 16:
		case 160:
			spr = spr_tutorialkeyspecial;
			ix = 0;
			break;
		case 17:
		case 162:
			spr = spr_tutorialkeyspecial;
			ix = 1;
			break;
		case 32:
			spr = spr_tutorialkeyspecial;
			ix = 2;
			break;
		default:
			spr = spr_tutorialkey;
			ix = 0;
			txt = chr(char);
			break;
	}
	return [spr, ix, txt];
}
function scr_string_width(str)
{
	var pos = 0;
	var w = 0;
	var originalstr = str;
	var str_arr = array_create(0);
	while (pos < string_length(originalstr))
	{
		if (string_copy(originalstr, pos, 2) == "\n")
		{
			array_push(str_arr, string_copy(originalstr, 1, pos));
			string_delete(originalstr, 1, pos);
			pos = 0;
			if (originalstr == "")
				break;
			continue;
		}
		pos++;
	}
	if (array_length(str_arr) == 0)
		w = string_width(str);
	for (var i = 0; i < array_length(str_arr); i++)
	{
		var b = str_arr[i];
		if (string_width(b) > w)
			w = string_width(b);
	}
	return w;
}
function scr_separate_text(str, font, width)
{
	draw_set_font(font);
	while (scr_string_width(str) > (width - string_width("a")))
	{
		var _pos = string_length(str);
		var _oldpos = _pos;
		while (string_char_at(str, _pos) != " ")
		{
			_pos--;
			if (_pos < 0)
				_pos = _oldpos;
		}
		if (string_char_at(str, _pos) == " ")
			str = string_delete(str, _pos, 1);
		str = string_insert("\n", str, _pos);
	}
	return str;
}
function scr_calculate_text(str)
{
	draw_set_font(font2);
	var pos = 0;
	for (var str2 = ""; pos <= string_length(str); str2 = scr_separate_text(str2))
	{
		pos++;
		str2 = string_insert(string_char_at(str, pos), str2, string_length(str2) + 1);
		str2 = scr_separate_text(str2)
	}
	return str2;
}
function scr_calculate_height(str)
{
	var str2 = scr_calculate_text(str);
	return string_height(str2);
}
