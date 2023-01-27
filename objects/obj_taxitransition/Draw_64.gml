if (start)
{
	draw_sprite(bgsprite, bgindex, 0, 0);
	shader_set(global.Pal_Shader);
	var cy = irandom_range(-shake_mag, shake_mag);
	scr_palette_texture(sprite_index, image_index, 0, cy, 1, 1, 0, c_white, 1, true);
	if (sprite_index != spr_taxitransition_gus)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
	else
		pal_swap_set(3113, obj_player1.paletteselect, false);
	draw_sprite(sprite_index, image_index, 0, cy);
	reset_shader_fix();
}
draw_set_alpha(fade);
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, 0, 0, 0, 0, false);
draw_set_alpha(1);
