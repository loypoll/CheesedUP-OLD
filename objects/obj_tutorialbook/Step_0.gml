if (global.panic && !donepanic)
{
	donepanic = true;
	text = lang_get_value("getout");
	event_perform(7, 4);
}
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(spr_tutorialbubble);
wave_timer += 20;
if (text_xscale != text_oldxscale)
	event_perform(7, 4);
if (showgranny)
{
	if (voicecooldown > 1)
		voicecooldown--;
	else if (!place_meeting(x, y, obj_player))
		voicecooldown = 0;
	if (place_meeting(x, y, obj_player))
	{
		sprite_index = spr_tutorialgranny_talk;
		if (voicecooldown == 0)
		{
			fmod_event_one_shot_3d("event:/sfx/voice/pizzagranny", x, y);
			voicecooldown = 100;
		}
	}
	else
		sprite_index = spr_tutorialgranny_sleep;
}
var _hide = false;
with (obj_grannypizzasign)
{
	if (text_state != 18)
		_hide = true;
}
if (instance_exists(obj_mrsticknotification))
	_hide = true;
switch (text_state)
{
	case 18:
		repeat (_hide + 1)
			text_y = Approach(text_y, -(text_sprite_height * text_yscale), 5);
		if (obj_player1.state != 290 && place_meeting(x, y, obj_player) && !_hide)
		{
			text_state = 135;
			text_vsp = 0;
		}
		break;
	case 135:
		text_y += text_vsp;
		if (text_vsp < 20)
			text_vsp += 0.5;
		if (text_y > text_ystart)
			text_state = 0;
		break;
	case 0:
		text_y = Approach(text_y, text_ystart, 2);
		if (!place_meeting(x, y, obj_player) || _hide)
			text_state = 18;
		break;
}
text_wave_x = Wave(-5, 5, 2, 10, wave_timer);
text_wave_y = Wave(-1, 1, 4, 0, wave_timer);
