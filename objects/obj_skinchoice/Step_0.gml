if live_call() return live_result;
if !init
	exit;

if keyboard_check_pressed(ord("R"))
{
	event_perform(ev_create, 0);
}

// get input
if anim_con == 0
	scr_getinput(true);
else
	scr_init_input();

// move
var move = key_left2 + key_right2;
if arrowbuffer == 0
	move += key_left + key_right;

if move != 0
{
	var prevpal = sel.pal;
	sel.pal = clamp(sel.pal + move, 0, array_length(palettes) - 1);
	
	if sel.pal != prevpal
	{
		charshift[0] = move;
		charshift[2] = 0; // alpha
		sound_play_multiple(sfx_angelmove);
	}
	
	if arrowbuffer == -1
		arrowbuffer = 25;
	else
		arrowbuffer = 5;
}
if key_left == 0 && key_right == 0
	arrowbuffer = -1;
if arrowbuffer > 0
	arrowbuffer--;

// charshifts
charshift[0] = lerp(charshift[0], 0, 0.25); // horizontal
charshift[1] = lerp(charshift[1], 0, 0.25); // vertical
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha

// cancel
if key_slap && anim_con == 0
{
	keyboard_clear(global.key_slap);
	global.in_menu = false;
	
	sound_play(sfx_back);
	anim_con = 1;
}
if anim_con == 1 && anim_t <= 0
	instance_destroy();

// select
if key_jump && is_method(select)
	select();

// functions
select = function()
{
	anim_con = 2;
	sound_play_centered(sfx_collecttoppin);
}
postdraw = function(curve)
{
	
}
draw = function(curve)
{
	var curve2 = anim_t;
	
	var pal = palettes[sel.pal];
	if anim_con == 1
	{
		curve = 1; // actual animated curve
		curve2 = 1; // the timer
	}
	
	// character
	var charx = 960 / 2 + charshift[0] * 100, chary = 540 / 2 - 16 + charshift[1] * 100;
	if pal.texture != noone
		scr_palette_texture(characters[sel.char][1], -1, charx, chary, 2, 2, 0, c_white, curve * charshift[2], true, pal.texture);
	
	shader_set(global.Pal_Shader);
	pal_swap_set(characters[sel.char][2], pal.palette, false);
	draw_sprite_ext(characters[sel.char][1], -1, charx, chary, 2, 2, 0, c_white, curve * charshift[2]);
	reset_shader_fix();
	
	// arrows
	if sel.pal > 0
	{
		var xx = 960 / 2 - 120 - sin(current_time / 200) * 4, yy = 540 / 2 + 16;
		if charshift[1] < 0
			xx += charshift[1];
		
		if palettes[sel.pal - 1].texture != noone
		{
			scr_palette_texture(spr_palettearrow, 0, xx, yy, 1, 1, 90, c_white, 1, true, palettes[sel.pal - 1].texture);
			draw_sprite_ext(spr_palettearrow, 1, xx, yy, 1, 1, 90, c_white, 1);
		}
		else
			draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 90, pal_swap_get_pal_color(characters[sel.char][2], palettes[sel.pal - 1].palette, 1), 1);
	}
	if sel.pal < array_length(palettes) - 1
	{
		var xx = 960 / 2 + 120 + sin(current_time / 200) * 4, yy = 540 / 2 + 16;
		if charshift[1] > 0
			xx += charshift[1];
		
		if palettes[sel.pal + 1].texture != noone
		{
			scr_palette_texture(spr_palettearrow, 0, xx, yy, 1, 1, 270, c_white, 1, true, palettes[sel.pal + 1].texture);
			draw_sprite_ext(spr_palettearrow, 1, xx, yy, 1, 1, 270, c_white, 1);
		}
		else
			draw_sprite_ext(spr_palettearrow, 0, xx, yy, 1, 1, 270, pal_swap_get_pal_color(characters[sel.char][2], palettes[sel.pal + 1].palette, 1), 1);
	}
	
	// text
	draw_set_font(lang_get_font("bigfont"));
	draw_set_align(fa_left);
	
	var name = string_upper(pal.name);
	var xx = 960 / 2 - string_width(name) / 2;
	
	for(var i = 1; i <= string_length(name); i++)
	{
		var char = string_char_at(name, i);
		
		var yy = 400;
		if curve2 != 1 // letters jump up
			yy = lerp(540, 400, min(animcurve_channel_evaluate(outback, curve2 + ((i % 3) * 0.075))));
		
		draw_text(xx + random_range(-1, 1), yy + random_range(-1, 1), char);
		xx += string_width(char);
	}
	
	draw_set_align(fa_center);
	draw_set_alpha(curve);
	draw_set_font(global.ptofont);
	draw_text(960 / 2, 450, pal.description);
	draw_set_alpha(1);
}
