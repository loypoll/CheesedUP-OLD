if (state == 18 || (state == 8 && dark))
	draw_sprite(spr_menudark, 0, 0, 0);
if (state == 183)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(1);
	draw_set_valign(1);
	var _str = embed_value_string(lang_get_value("menu_delete"), [string(currentselect + 1)]);
	draw_text_color(obj_screensizer.actual_width / 2, (obj_screensizer.actual_height / 2) - 30, _str, c_white, c_white, c_white, c_white, 1);
	var w = string_width(_str) / 2;
	draw_sprite(spr_menu_filedelete, index, (obj_screensizer.actual_width / 2) + w + 70, obj_screensizer.actual_height / 2);
	draw_sprite(spr_menu_filedelete, index, (obj_screensizer.actual_width / 2) - w - 70, obj_screensizer.actual_height / 2);
	var c1 = (deleteselect == 0) ? c_white : 8421504;
	var c2 = (deleteselect == 1) ? c_white : 8421504;
	draw_text_color((obj_screensizer.actual_width / 2) - 100, (obj_screensizer.actual_height / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	draw_text_color((obj_screensizer.actual_width / 2) + 100, (obj_screensizer.actual_height / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
}
else if (state == 289)
{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, 0, 0, 0, 0, false);
	draw_set_alpha(1);
	draw_set_font(lang_get_font("bigfont"));
	draw_set_halign(1);
	draw_set_valign(1);
	draw_sprite(spr_menu_byebye, index, (obj_screensizer.actual_width / 2) + 210, obj_screensizer.actual_height / 2);
	draw_sprite(spr_menu_byebye, index, (obj_screensizer.actual_width / 2) - 210, obj_screensizer.actual_height / 2);
	draw_text_color(obj_screensizer.actual_width / 2, (obj_screensizer.actual_height / 2) - 30, lang_get_value("menu_exit"), c_white, c_white, c_white, c_white, 1);
	c1 = (exitselect == 0) ? c_white : 8421504;
	c2 = (exitselect == 1) ? c_white : 8421504;
	draw_text_color((obj_screensizer.actual_width / 2) - 100, (obj_screensizer.actual_height / 2) + 30, lang_get_value("option_yes"), c1, c1, c1, c1, 1);
	draw_text_color((obj_screensizer.actual_width / 2) + 100, (obj_screensizer.actual_height / 2) + 30, lang_get_value("option_no"), c2, c2, c2, c2, 1);
}
