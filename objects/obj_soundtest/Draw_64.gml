draw_set_font(global.tutorialfont);
draw_set_halign(1);
draw_set_valign(1);
draw_sprite(spr_nowplaying, image_index, obj_screensizer.actual_width / 2, 0);
draw_text_color(obj_screensizer.actual_width / 2, 66, music_arr[music_pos][1], c_black, c_black, c_black, c_black, 1);
