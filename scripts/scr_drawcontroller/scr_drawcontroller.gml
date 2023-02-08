function get_dark(argument0, argument1, argument2 = false, argument3 = 0, argument4 = 0)
{
	if (argument1)
	{
		if (room == boss_vigilante)
			argument0 = make_color_rgb(247, 109, 22);
		var d = room_width * room_height;
		var b = d;
		var bb = b;
		with (obj_lightsource)
		{
			if (object_index != obj_lightsource_attach || instance_exists(objectID))
			{
				if (!argument2)
					var dis = distance_to_object(other);
				else
					dis = distance_between_points(x, y, argument3, argument4);
				if (dis < d)
				{
					bb = dis / distance;
					if (bb < b)
					{
						b = bb;
						d = dis;
					}
				}
			}
		}
		var t = (b + 0.4) * 255;
		var a = (1 - obj_drawcontroller.dark_alpha) * 255;
		a -= 102;
		t = clamp(t, 0, 255);
		a = clamp(a, 0, 255);
		var r = (color_get_red(argument0) - t) + a;
		var g = (color_get_green(argument0) - t) + a;
		b = (color_get_blue(argument0) - t) + a;
		if (r < 0)
			r = 0;
		if (g < 0)
			g = 0;
		if (b < 0)
			b = 0;
		return make_color_rgb(r, g, b);
	}
	else
		return image_blend;
}
function enemy_is_superslam(baddieid)
{
	with baddieid
	{
		if state == 4
		{
			var g = grabbedby == 1 ? obj_player1.id : obj_player2.id;
			if g.state == 76 || (g.state == 61 && g.tauntstoredstate == 76)
				return true;
		}
	}
	return false;
}
function enemy_is_swingding(baddieid)
{
    with baddieid
    {
        if state == 4
        {
            g = grabbedby == 1 ? obj_player1.id : obj_player2.id;
            if (g.state == 79 || (g.state == 61 && g.tauntstoredstate == 79)) && g.sprite_index == g.spr_swingding
                return true;
        }
    }
    return false;
}
function draw_enemy(healthbar, palette, color = c_white)
{
	var _stun = 0;
	if ((state == 138 && thrown == 0 && object_index != obj_peppinoclone) || state == 294 || (state == 262 && sprite_index == stunfallspr))
		_stun = 25;
	if (state == 294 && object_index == obj_gustavograbbable)
		_stun = 0;
	if (visible && object_index != obj_pizzaball && object_index != obj_fakesanta && bbox_in_camera(view_camera[0], 32))
	{
		var c = image_blend;
		if (elite)
			c = 65535;
		if (elitegrab)
			c = 32768;
		if (color != c_white)
			c = color;
		var b = get_dark(c, obj_drawcontroller.use_dark);
		if (object_index == obj_peppinoclone)
		{
			shader_set(global.Pal_Shader);
			pal_swap_set(spr_peppalette, 1, false);
		}
		else if (usepalette && palette)
		{
			shader_set(global.Pal_Shader);
			pal_swap_set(spr_peppalette, 0);
			if (object_index == obj_fakepepboss || object_index == obj_gustavograbbable)
				scr_palette_texture(sprite_index, image_index, x, y + _stun, image_xscale * xscale, image_yscale * yscale, angle, b, image_alpha);
			pal_swap_set(spr_palette, paletteselect, false);
		}
		var _ys = 1;
		if (state == 4)
		{
			if (enemy_is_superslam(id))
			{
				_stun += 18;
				_ys = -1;
			}
		}
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
		if (healthbar)
		{
			if (hp > maxhp)
				maxhp = hp;
			draw_healthbar(x - 16, y - 50, x + 16, y - 45, (hp / maxhp) * 100, 0, 255, 255, 0, true, true);
		}
		if (object_index == obj_fakepepboss)
		{
			if (miniflash)
			{
				pal_swap_set(spr_peppalette, 14, false);
				draw_sprite_ext(sprite_index, image_index, x, y + _stun, xscale * image_xscale, yscale * _ys, angle, b, image_alpha);
			}
		}
		if (object_index == obj_peppinoclone || (usepalette && palette))
			shader_reset();
		if (object_index == obj_hamkuff)
		{
			if (state == 206 && instance_exists(playerid))
			{
				var x1 = x + (6 * image_xscale);
				var y1 = y + 29;
				if (sprite_index == spr_hamkuff_chain2)
				{
					x1 = x + (15 * image_xscale);
					y1 = y + 33;
				}
				var dis = point_distance(x1, y1, playerid.x, playerid.y);
				var w = 24;
				var len = dis div w;
				var dir = point_direction(x1, y1, playerid.x, playerid.y + 16);
				var xx = lengthdir_x(w, dir);
				var yy = lengthdir_y(w, dir);
				for (var i = 0; i < len; i++)
					draw_sprite_ext(spr_hamkuff_sausage, -1, x1 + (xx * i), y1 + (yy * i), 1, 1, dir, b, 1);
			}
		}
	}
}
function draw_superslam_enemy()
{
	if (state == 76 && floor(image_index) >= 5 && floor(image_index) <= 7 && instance_exists(baddiegrabbedID))
	{
		with (baddiegrabbedID)
			draw_enemy(global.kungfu, true);
	}
}
function draw_player()
{
	var b = get_dark(image_blend, other.use_dark);
	if (object_index == obj_player1)
		scr_palette_texture(sprite_index, image_index, x, y, xscale * scale_xs, yscale * scale_ys, angle, b, image_alpha);
	var ps = paletteselect;
	var spr = spr_palette;
	if (isgustavo)
		spr = spr_ratmountpalette;
	pal_swap_set(spr, ps, false);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale * scale_xs, yscale * scale_ys, angle, b, image_alpha);
	if (global.noisejetpack)
	{
		pal_swap_set(spr_peppalette, 2, false);
		draw_sprite_ext(sprite_index, image_index, x, y, xscale * scale_xs, yscale * scale_ys, angle, b, image_alpha);
	}
	draw_superslam_enemy();
	if (global.pistol)
	{
		pal_swap_set(spr_peppalette, 0, false);
		if (pistolcharge >= 4)
			draw_sprite(spr_revolvercharge, pistolcharge, x, y - 70);
	}
}
