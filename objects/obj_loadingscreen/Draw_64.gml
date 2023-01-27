if (dark)
	draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, 0, 0, 0, 0, false);
else
	scr_draw_pause_image();
draw_set_halign(2);
draw_set_valign(2);
draw_set_font(lang_get_font("creditsfont"));
draw_text_color(obj_screensizer.actual_width - 16, obj_screensizer.actual_height - 16, lang_get_value("menu_loading"), c_white, c_white, c_white, c_white, 1);
