var _transfo = false;
var _state = other.state;
with (other)
{
	if (!scr_transformationcheck() && state != 95 && state != 112)
	{
		if (state == 16)
			notification_push(41, [ghosttimer, room]);
		if (state == 11 || state == 12 || state == 14 || state == 13 || state == 12 || state == 33 || state == 35 || state == 34 || state == 16 || state == 116 || state == 113 || state == 114)
		{
			if (hsp != 0)
				xscale = sign(hsp);
			movespeed = abs(hsp);
		}
		transformationsnd = false;
		state = 0;
		sprite_index = spr_idle;
		dir = xscale;
		ghostdash = false;
		ghostpepper = 0;
		_transfo = true;
		instance_create(x, y, obj_genericpoofeffect);
	}
}
if (_transfo)
{
	fmod_event_one_shot("event:/sfx/pep/pray");
	var p = other.id;
	with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
	{
		priestID = other.id;
		playerid = p;
	}
	with (other)
	{
		if (state == 11 || state == 14 || state == 12 || state == 13)
			create_debris(x, y - 40, 2236);
	}
	if (sprite_index != spr_angelpriest)
		sprite_index = spr_priest_pray;
	if (collect && ds_list_find_index(global.saveroom, id) == -1)
	{
		notification_push(25, [room, id, _state]);
		ds_list_add(global.saveroom, id);
		var val = 500;
		global.collect += val;
		global.combotime = 60;
		with (instance_create(x + 16, y, obj_smallnumber))
			number = string(val);
		scr_sound_multiple("event:/sfx/misc/collect", x, y);
		if (escape)
			ds_list_add(global.escaperoom, id);
		var d = round(val / 16);
		for (var i = 0; i < val; i += d)
			create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), choose(2082, 2084, 2085, 2087, 2083), d);
	}
}
