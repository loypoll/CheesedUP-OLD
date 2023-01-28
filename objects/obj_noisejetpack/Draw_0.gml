if (state != 8 && state != 146)
	draw_self();
else if (state == 8)
{
	draw_set_alpha(orangealpha);
	with (playerid)
	{
		shader_set(12);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		shader_reset();
	}
	draw_set_alpha(1);
	with (obj_firemouthflame)
		draw_self();
}
else if (state == 146)
{
	draw_rectangle_color(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + SCREEN_WIDTH, camera_get_view_y(view_camera[0]) + SCREEN_HEIGHT, c_white, c_white, c_white, c_white, false);
	with (playerid)
	{
		shader_set(global.Pal_Shader);
		var ps = paletteselect;
		scr_palette_texture(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		pal_swap_set(spr_palette, ps, false);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		if (global.noisejetpack)
		{
			pal_swap_set(spr_palette, 2, false);
			draw_sprite_ext(sprite_index, image_index, x, y, xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
		shader_reset();
	}
	with (obj_firemouthflame)
		draw_self();
}
