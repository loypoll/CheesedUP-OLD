function create_afterimage()
{
	var q = 
	{
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.afterimage_color1, global.afterimage_color2),
		image_xscale: 1,
		image_yscale: 1,
		identifier: 0,
		visible: true,
		alpha: 1
	};
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_mach3effect(argument0, argument1, argument2, argument3, argument4 = false)
{
	var q = 
	{
		x: argument0,
		y: argument1,
		sprite_index: argument2,
		image_index: argument3,
		image_angle: 0,
		alarm: [15, 6, -1],
		image_blend: choose(global.mach_color1, global.mach_color2),
		image_xscale: 1,
		image_yscale: 1,
		visible: true,
		identifier: 1,
		playerid: obj_player1,
		alpha: 1
	};
	if (argument4)
		q.identifier = 0;
	ds_list_add(global.afterimage_list, q);
	return q;
}
function create_heatattack_afterimage()
{
	var _velocity = 6;
	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = 2;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = _velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = 2;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = -_velocity;
		vsp = 0;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = 2;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = 0;
		vsp = _velocity;
		image_blend = global.afterimage_color1;
	}
	with (create_afterimage(argument0, argument1, argument2, argument3))
	{
		identifier = 2;
		alarm[1] = -1;
		alarm[2] = -1;
		alarm[0] = 8;
		image_xscale = argument4;
		hsp = 0;
		vsp = -_velocity;
		image_blend = global.afterimage_color1;
	}
}
function create_firemouth_afterimage()
{
	var b = create_afterimage(argument0, argument1, argument2, argument3);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = 3;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = argument4;
		image_blend = make_color_rgb(248, 112, 24);
		alpha = 0.8;
		basealpha = 1;
		playerid = -4;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_blue_afterimage()
{
	var b = create_afterimage(argument0, argument1, argument2, argument3);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = 4;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_xscale = argument4;
		image_blend = make_color_rgb(44, 126, 228);
		alpha = 0.8;
		basealpha = 1;
		playerid = -4;
		vertical = false;
		maxmovespeed = 10;
	}
	return b;
}
function create_red_afterimage()
{
	var b = create_blue_afterimage(argument0, argument1, argument2, argument3, argument4);
	with (b)
		identifier = 6;
	return b;
}
function create_blur_afterimage()
{
	var b = create_afterimage(argument0, argument1, argument2, argument3);
	with (b)
	{
		fadeout = false;
		fadeoutstate = -4;
		identifier = 5;
		alarm[0] = -1;
		alarm[1] = -1;
		alarm[2] = -1;
		image_blend = c_white;
		image_xscale = argument4;
		alpha = 0.8;
		playerid = -4;
		spd = 0.15;
		hsp = 0;
		vsp = 0;
	}
	return b;
}
