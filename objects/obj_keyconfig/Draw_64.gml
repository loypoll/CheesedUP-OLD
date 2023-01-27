draw_set_font(lang_get_font("bigfont"));
draw_set_alpha(1);
draw_set_halign(0);
draw_set_valign(1);
draw_set_color(c_white);
var c = (key_select == -1) ? c_white : 8421504;
draw_text_colour((obj_screensizer.actual_width / 2) - 250, 50, lang_get_value("option_back"), c, c, c, c, 1);
for (var i = 0; i < array_length(input); i++)
{
	var b = input[i];
	var val = variable_global_get(b[0]);
	if (selecting && key_select == i)
		val = -1;
	c = (key_select == i) ? c_white : 8421504;
	var yy = 50 + (50 * i);
	draw_sprite_ext(spr_controlicons, i, (obj_screensizer.actual_width / 2) - 60, yy, 1, 1, 0, c, 1);
	if (val != -4)
		draw_text_color((obj_screensizer.actual_width / 2) + 100, yy, scr_keyname(val), c, c, c, c, 1);
}
