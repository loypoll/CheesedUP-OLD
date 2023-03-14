if live_call() return live_result;
if !init
	exit;

// get input
if anim_con == 0
	scr_getinput(true);
else
	scr_init_input();

#region change palette

var move_hor = key_left2 + key_right2;
if arrowbuffer == 0
	move_hor += key_left + key_right;

if move_hor != 0
{
	var prevpal = sel.pal;
	sel.pal = clamp(sel.pal + move_hor, 0, array_length(palettes) - 1);
	
	if sel.pal != prevpal
	{
		charshift[0] = move_hor;
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

#endregion
#region change character

var move_ver = key_down2 - key_up2;
if move_ver != 0
{
	var prevpal = sel.char;
	sel.char = clamp(sel.char + move_ver, 0, array_length(characters) - 1);
	
	if sel.char != prevpal
	{
		charshift[1] = move_ver;
		charshift[2] = 0; // alpha
		sound_play_multiple(sfx_angelmove);
		event_user(0);
	}
}

#endregion

// charshifts
charshift[0] = lerp(charshift[0], 0, 0.25); // horizontal
charshift[1] = lerp(charshift[1], 0, 0.25); // vertical
charshift[2] = lerp(charshift[2], 1, 0.25); // alpha

// cancel
if key_slap && anim_con == 0
{
	close_menu();
	sound_play(sfx_back);
	anim_con = 1;
}
if anim_con != 0 && anim_t <= 0
	instance_destroy();

// select
if key_jump && is_method(select) && anim_t >= 1
	select();

if characters[sel.char][0] == "N" && key_taunt2
{
	sound_play(sfx_step);
	noisetype = !noisetype;
}