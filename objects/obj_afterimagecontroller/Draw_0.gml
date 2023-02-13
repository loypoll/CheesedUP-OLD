for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with (b)
	{
		if (visible)
		{
			b = image_blend;
			var a = other.alpha[identifier];
			var shd = false;
			if (identifier == afterimage.firemouth)
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 0.97);
				shader_set_uniform_f(other.shd_color_green, 0.43);
				shader_set_uniform_f(other.shd_color_blue, 0.09);
			}
			else if (identifier == afterimage.blue)
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 0.17);
				shader_set_uniform_f(other.shd_color_green, 0.49);
				shader_set_uniform_f(other.shd_color_blue, 0.9);
			}
			else if (identifier == afterimage.enemy)
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 0.8745098039215686);
				shader_set_uniform_f(other.shd_color_green, 0.1843137254901961);
				shader_set_uniform_f(other.shd_color_blue, 0);
			}
			else if (identifier == afterimage.fakepep)
			{
				a = alpha;
				shd = true;
				shader_set(shd_color_afterimage);
				shader_set_uniform_f(other.shd_color_red, 1);
				shader_set_uniform_f(other.shd_color_green, 0);
				shader_set_uniform_f(other.shd_color_blue, 0);
			}
			else if (identifier == afterimage.blur)
			{
				a = alpha;
				b = get_dark(other.image_blend, obj_drawcontroller.use_dark, true, x, y);
				if (instance_exists(playerid) && playerid.usepalette)
				{
					shd = true;
					if (playerid.object_index == obj_player1)
						scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a);
					shader_set(global.Pal_Shader);
					pal_swap_set(playerid.spr_palette, playerid.paletteselect, false);
				}
			}
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, a);
			if (shd)
				shader_reset();
		}
	}
}
