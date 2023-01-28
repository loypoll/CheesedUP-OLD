draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);
for (var i = 0; i < array_length(bg_alpha); i++)
	draw_sprite_tiled_ext(spr_optionsBG, i, bg_x, bg_y, 1, 1, c_white, bg_alpha[i]);
if (room != Mainmenu)
{
	with (obj_keyconfig)
		event_perform(8, 64);
}
if (instance_exists(obj_keyconfig))
	exit;
draw_set_font(lang_get_font("bigfont"));
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
var _os = optionselected;
var m = menus[menu];
var options = m.options;
var len = array_length(options);
var size = (string_height("A") * len) + (len * m.ypad);
var xx = SCREEN_WIDTH / 2;
var yy = (SCREEN_HEIGHT / 2) - (size / 4);
switch (m.anchor)
{
	case 0:
		draw_set_halign(1);
		draw_set_valign(0);
		var c = c_white;
		var a = 1;
		for (i = 0; i < len; i++)
		{
			var o = options[i];
			c = 8421504;
			if (i == _os)
				c = c_white;
			var t = lang_get_value(o.name);
			draw_text_color(xx, yy + (m.ypad * i), t, c, c, c, c, a);
			if (menu == 0)
				scr_pauseicon_draw(i, xx + (string_width(t) / 2) + 50, yy + (m.ypad * i));
		}
		break;
	case 1:
		draw_set_halign(0);
		draw_set_valign(0);
		xx = m.xpad;
		c = c_white;
		a = 1;
		for (i = 0; i < len; i++)
		{
			draw_set_halign(0);
			o = options[i];
			c = 8421504;
			if (i == _os)
				c = c_white;
			draw_text_color(xx, yy + (m.ypad * i), lang_get_value(o.name), c, c, c, c, a);
			draw_set_halign(2);
			switch (o.type)
			{
				case 0:
					draw_text_color(SCREEN_WIDTH - m.xpad, yy + (m.ypad * i), o.value ? lang_get_value("option_on") : lang_get_value("option_off"), c, c, c, c, a);
					break;
				case 3:
					var w = 200;
					var h = 5;
					var aw = w * (o.value / 100);
					var x1 = SCREEN_WIDTH - m.xpad - w;
					var y1 = yy + (m.ypad * i);
					var x2 = x1 + aw;
					var y2 = y1 + h;
					draw_set_alpha(a);
					draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c_dkgray, a);
					draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c, a);
					draw_set_alpha(1);
					draw_sprite(spr_slidericon, o.moving ? 1 : 0, x2, y2 - h);
					break;
				case 1:
					var select = o.values[o.value];
					var n = select.name;
					if (select.localization)
						n = lang_get_value(select.name);
					draw_text_color(SCREEN_WIDTH - m.xpad, yy + (m.ypad * i), n, c, c, c, c, a);
					break;
			}
		}
		break;
}
if (room != Mainmenu)
{
	with (obj_transfotip)
		event_perform(8, 64);
}
