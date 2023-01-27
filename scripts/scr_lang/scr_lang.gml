function scr_get_languages()
{
	global.lang_map = ds_map_create();
	global.lang = "en";
	var arr = [];
	for (var file = file_find_first("lang/*.txt", 0); file != ""; file = file_find_next())
		array_push(arr, file);
	file_find_close();
	for (var i = 0; i < array_length(arr); i++)
	{
		var fo = file_text_open_read(("lang/" + arr[i]));
        var str = "";
        while (!file_text_eof(fo))
        {
            str += file_text_readln(fo);
            str += "\n";
        }
		file_text_close(fo);
		lang_parse(str);
	}
	global.credits_arr = scr_lang_get_credits();
}
function scr_lang_get_credits()
{
	var fo = file_text_open_read("credits.txt");
	var arr = array_create(0);
	while (!file_text_eof(fo))
		array_push(arr, file_text_readln(fo));
	file_text_close(fo);
	return arr;
}
function lang_get_value()
{
	var n = ds_map_find_value(ds_map_find_value(global.lang_map, global.lang), argument0);
	if (is_undefined(n))
		n = ds_map_find_value(ds_map_find_value(global.lang_map, "en"), argument0);
	return n;
}
function lang_get_value_newline()
{
	return string_replace_all(lang_get_value(argument0), "\\n", "\n");
}
function lang_parse()
{
	var list = ds_list_create();
	lang_lexer(list, argument0);
	var map = lang_exec(list);
	var lang = ds_map_find_value(map, "lang");
	ds_map_set(global.lang_map, lang, map);
	ds_list_destroy(list);
}
function lang_lexer()
{
	var len = string_length(argument1);
	var pos = 1;
	while (pos <= len)
	{
		var start = pos;
		var char = string_ord_at(argument1, pos);
		pos += 1;
		switch (char)
		{
			case 32:
			case 9:
			case 13:
			case 10:
				break;
			case 35:
				while (pos <= len)
				{
					char = string_ord_at(argument1, pos);
					if (char == 13 || char == 10)
						break;
					pos += 1;
				}
				break;
			case 61:
				ds_list_add(argument0, [0, start]); // (0 << 0) in mod tool, so it's an enum
				break;
			case 34:
				while (pos <= len)
				{
					char = string_ord_at(argument1, pos);
					if (char != 34 || string_ord_at(argument1, pos - 1) == 92)
						pos += 1;
					else
						break;
				}
				if (pos <= len)
				{
					var val = string_copy(argument1, start + 1, pos - start - 1);
					string_replace_all(val, "\\\"", "\"");
					ds_list_add(argument0, [2, start, val]); // 2 is enum
					pos += 1;
				}
				else
					exit;
				break;
			default:
				if (lang_get_identifier(char, false))
				{
					while (pos <= len)
					{
						char = string_ord_at(argument1, pos);
						if (lang_get_identifier(char, true))
							pos += 1;
						else
							break;
					}
					var name = string_copy(argument1, start, pos - start);
					switch (name)
					{
						case "false":
							ds_list_add(argument0, [3, start, false]); // 3 is enum
							break;
						case "true":
							ds_list_add(argument0, [3, start, true]); // 3 is enum
							break;
						default:
							ds_list_add(argument0, [1, start, name]); // 1 is enum
					}
				}
				break;
		}
	}
	ds_list_add(argument0, [4, len + 1]); // 4 is enum
}
function lang_get_identifier()
{
	if (argument1)
		return argument0 == 95 || (argument0 >= 97 && argument0 <= 122) || (argument0 >= 65 && argument0 <= 90) || (argument0 >= 48 && argument0 <= 57);
	else
		return argument0 == 95 || (argument0 >= 97 && argument0 <= 122) || (argument0 >= 65 && argument0 <= 90);
}
function lang_exec()
{
	var map = ds_map_create();
	var len = ds_list_size(argument0);
	var pos = 0;
	while (pos < len)
	{
		var q = ds_list_find_value(argument0, pos++);
		switch (q[0])
		{
			case 0:
				var ident = array_get(ds_list_find_value(argument0, pos - 2), 2);
				var val = array_get(ds_list_find_value(argument0, pos++), 2);
				ds_map_set(map, ident, val);
				break;
		}
	}
	return map;
}
function lang_get_custom_font()
{
	var font_map = ds_map_find_value(argument1, concat(argument0, "_map"));
	var font_size = string_length(font_map);
	var font_sep = ds_map_find_value(argument1, concat(argument0, "_sep"));
	font_sep = real(font_sep);
	var font_xorig = 0;
	var font_yorig = 0;
	var spr = sprite_add(concat("lang/", ds_map_find_value(argument1, concat(argument0, "_dir"))), font_size, true, false, font_xorig, font_yorig);
	return font_add_sprite_ext(spr, font_map, false, font_sep);
}
function lang_get_font()
{
	var n = ds_map_find_value(global.font_map, lang_get_value(argument0));
	if (!is_undefined(n))
		return n;
	return ds_map_find_value(global.font_map, concat(argument0, "_en"));
}
