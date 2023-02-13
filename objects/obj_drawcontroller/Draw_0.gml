draw_set_color(c_black);
draw_rectangle(0, -50, -50, room_height + 50, false);
draw_rectangle(room_width, -50, room_width + 50, room_height + 50, false);
draw_rectangle(0, 0, room_width, -50, false);
draw_rectangle(0, room_height, room_width, room_height + 50, false);
draw_set_color(c_white);
draw_set_color(c_white);
if (use_dark)
{
	for (var i = 0; i < array_length(objdark_arr); i++)
	{
		with (objdark_arr[i])
		{
			if (visible)
			{
				var b = get_dark(image_blend, other.use_dark);
				var ix = image_xscale;
				if (object_index == obj_vigilantecow)
					ix = xscale;
				draw_sprite_ext(sprite_index, image_index, x, y, ix, image_yscale, image_angle, b, image_alpha);
			}
		}
	}
}
if (obj_player1.finisher || obj_player2.finisher || (obj_player.state == 252 && obj_player.superattackstate == 8))
	finisher_alpha = Approach(finisher_alpha, 0.3, 0.1);
else if (finisher_alpha > 0)
	finisher_alpha = Approach(finisher_alpha, 0, 0.02);
if (finisher_alpha > 0)
{
	draw_set_alpha(finisher_alpha);
	draw_rectangle_color(-32, -32, room_width + 32, room_height + 32, 0, 0, 0, 0, false);
	draw_set_alpha(1);
}
var _kungfu = global.kungfu;
with (obj_baddie)
{
	if (object_index != obj_pizzafaceboss)
		draw_enemy(_kungfu, true);
}
shader_set(global.Pal_Shader);
with (obj_heatafterimage)
{
	if (visible)
	{
		scr_palette_texture(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, obj_player1.angle, c_white, 1);
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false);
		draw_sprite_ext(obj_player1.sprite_index, obj_player1.image_index, x, y, obj_player1.xscale, obj_player1.yscale, obj_player1.angle, c_white, alpha);
	}
}
shader_set(shd_hit);
with (obj_baddie)
{
	var _stun = 0;
	if (state == states.stun && object_index != obj_pizzaball)
		_stun = 25;
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale, angle, image_blend, image_alpha);
}
with (obj_deadjohnparent)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x + hurtx, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
with (obj_smallnumber)
{
	if (visible && flash)
	{
		draw_set_font(global.smallnumber_fnt);
		draw_set_halign(1);
		draw_text(x, y, number);
	}
}
for (i = 0; i < array_length(flash_arr); i++)
{
	with (flash_arr[i])
	{
		if (visible && flash)
			event_perform(8, 0);
	}
}
shader_set(global.Pal_Shader);
pal_swap_set(spr_peppalette, 0, false);
with (obj_pizzagoblinbomb)
{
	if (grabbable && grounded && vsp > 0)
		draw_sprite(spr_grabicon, -1, x - 10, y - 30);
	draw_self();
}
with (obj_player2)
{
	if (visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
}
with (obj_player1)
{
	if (visible && state != states.titlescreen && bbox_in_camera(view_camera[0], 32))
		draw_player();
}
with (obj_sausageman_dead)
{
	if (!gui && visible && bbox_in_camera(view_camera[0], 32))
	{
		b = get_dark(image_blend, other.use_dark);
		if (oldpalettetexture != -4)
			scr_palette_texture(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha, false, oldpalettetexture);
		pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, angle, b, image_alpha);
	}
}
shader_set(shd_hit);
with (obj_player)
{
	if (visible && flash && bbox_in_camera(view_camera[0], 32))
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
}
shader_reset();
