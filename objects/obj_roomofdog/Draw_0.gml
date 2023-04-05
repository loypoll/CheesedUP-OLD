while surface_get_target() > 0
	surface_reset_target();
application_surface_draw_enable(true);

draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

shader_set(global.Pal_Shader);
pal_swap_set(spr_peppalette, 1, false);
draw_sprite_ext(spr_player_scaredjump3, sprite_get_number(spr_player_scaredjump3) - 1, 960 / 2, 540 / 2, 2, 2, 0, c_white, 1);
shader_reset();

draw_set_colour(c_white);
draw_set_align(fa_center);
draw_set_font(global.font_small);

//draw_text(960 / 2, 90, "Why the fuck did you do this it's like\nthe first ever build what is wrong with you");
