if !sprite_exists(sprite_index)
	exit;

draw_self();
if (!check_wall(x - 1, y))
	draw_sprite_ext(spr_left, image_index, x, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
if (!check_wall(x + 1, y))
	draw_sprite_ext(spr_right, image_index, (x + sprite_width) - 32, y, sign(image_xscale), image_yscale, image_angle, image_blend, image_alpha);
