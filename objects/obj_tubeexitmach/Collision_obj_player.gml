if (playerid > -1)
	exit;
if (state != 0)
	exit;
if (other.state == 107)
	exit;
if (other.state == states.gotoplayer)
	exit;
if (other.state == 214)
	exit;
if (other.state == 213)
	exit;
if (other.state == 212)
	exit;
if (object_index != obj_tubeenter && other.state != states.tube)
	exit;
var _offset_x = 32 * image_xscale;
var _offset_y = 14 * image_yscale;
with (other)
{
	if (other.object_index == obj_tubeenter)
	{
		shot = false;
		if (state != states.tube)
		{
			repeat (6)
				create_debris(x, y, spr_waterdrop, false);
		}
	}
	state = states.tube;
	hsp = 0;
	movespeed = 0;
	vsp = 0;
	tube_vsp = 0;
	x = Approach(x, other.xstart + _offset_x, other.approach_spd);
	y = Approach(y, other.ystart + _offset_y, other.approach_spd);
	if (y > (other.y + _offset_y))
		tube_vsp = -other.approach_spd;
}
if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
	GamepadSetVibration(0, 0.8, 0.8, 0.65);
	other.x = xstart + _offset_x;
	other.y = ystart + _offset_y;
	image_index = 0;
	playerid = other.id;
	if (object_index == obj_tubeenter)
		fmod_event_one_shot_3d("event:/sfx/pipe/start", x, y);
	else
		fmod_event_one_shot_3d("event:/sfx/pipe/end", x, y);
	image_speed = 0.5;
	other.state = states.tube;
	other.tube_vsp = 0;
	state = states.tube;
}
