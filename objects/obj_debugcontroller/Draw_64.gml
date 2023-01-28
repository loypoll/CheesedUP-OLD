if (DEBUG)
{
	if (!active)
		exit;
	draw_set_font(-1);
	draw_set_halign(0);
	draw_set_valign(0);
	draw_set_alpha(0.7);
	draw_rectangle_color(0, 0, SCREEN_WIDTH, 152, 0, 0, 0, 0, false);
	var search_y = 152;
	if (input_text != "" && !ds_list_empty(search_commands))
	{
		var search_h = 152 + (ds_list_size(search_commands) * 16) + 16;
		draw_rectangle_color(0, search_y + 1, search_w + 16, search_h, 0, 0, 0, 0, false);
	}
	draw_set_alpha(1);
	var ys = 128 - (16 * ds_list_size(text_list));
	for (var i = 0; i < ds_list_size(text_list); i++)
	{
		var t = array_get(ds_list_find_value(text_list, i), 0);
		var txt = array_get(ds_list_find_value(text_list, i), 1);
		var str = txt;
		var c = c_white;
		switch (t)
		{
			case 3:
				str = concat("[ERROR] ", txt);
				c = 255;
				break;
			case 2:
				str = concat("[DEBUG] ", txt);
				c = 8421504;
				break;
			case 1:
				str = concat("[COMMAND] ", txt);
				c = 32768;
				break;
		}
		draw_text_color(8, ys + (16 * i), str, c, c, c, c, 1);
	}
	draw_text(8, 128, concat("> ", input_text));
	if (input_text != "")
	{
		search_y += 8;
		for (var w = 0; w < ds_list_size(search_commands); w++)
		{
			var b = ds_list_find_value(search_commands, w);
			if (b != undefined)
				draw_text_color(8, search_y + (16 * w), b, c_white, c_white, c_white, c_white, 1);
		}
	}
}
