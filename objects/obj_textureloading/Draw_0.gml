draw_sprite_ext(spr_splashscreen, 0, 0, 0, 1, 1, 0, c_white, image_alpha);
if image_alpha < 1
	exit;

var p = tex_max - array_length(tex_list);
var t = (p / tex_max) * 100;
draw_healthbar(0, SCREEN_HEIGHT - 4, SCREEN_WIDTH, SCREEN_HEIGHT, t, 0, c_white, c_white, 0, false, true);
