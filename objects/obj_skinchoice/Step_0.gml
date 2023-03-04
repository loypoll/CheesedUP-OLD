if live_call() return live_result;
if !init
	exit;

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
	close_menu();
	sound_play(sfx_back);
	anim_con = 1;
}
if anim_con != 0 && anim_t <= 0
	instance_destroy();

// select
if key_jump && is_method(select) && anim_t >= 1
	select();
