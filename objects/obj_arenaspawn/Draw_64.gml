draw_set_halign(1);
draw_set_color(c_white);
draw_set_font(global.bigfont);
if (state == 145)
	draw_text(random_range(1, -1) + (obj_screensizer.actual_width / 2), random_range(1, -1) + 500, "ROUND " + string(wave + 1));
