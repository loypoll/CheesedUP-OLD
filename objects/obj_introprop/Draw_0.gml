if (!sprite_exists(sprite_index))
	exit;
if (sprite_index != spr_towerending_gustavo && sprite_index != spr_towerending_peppino && sprite_index != spr_towerending_bosses)
	draw_self();
else
{
	shader_set(global.Pal_Shader);
	scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	if (sprite_index == spr_towerending_gustavo)
		pal_swap_set(3113, obj_player1.paletteselect, false);
	else
		pal_swap_set(706, obj_player1.paletteselect, false);
	draw_self();
	shader_reset();
}
