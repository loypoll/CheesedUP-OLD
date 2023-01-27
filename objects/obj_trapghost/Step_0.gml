if (room == timesuproom)
	instance_destroy();
switch (state)
{
	case 0:
		sprite_index = spr_kingghost;
		var dir = point_direction(x, y, obj_player1.x, obj_player1.y);
		x = lerp(x, obj_player1.x - (100 * obj_player1.xscale), 0.05);
		y = lerp(y, obj_player1.y - 100, 0.05);
		if (x != obj_player1.x)
			image_xscale = -sign(x - obj_player1.x);
		break;
	case 8:
		sprite_index = spr_kingghost_dash;
		if (!instance_exists(trapid) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap))
			state = 0;
		if (instance_exists(trapid))
		{
			var xto = trapid.x + trapid.xoffset;
			var yto = trapid.y + trapid.yoffset;
			dir = point_direction(x, y, xto, yto);
			x = Approach(x, xto, abs(lengthdir_x(32, dir)));
			y = Approach(y, yto, abs(lengthdir_y(32, dir)));
			if (x == xto && y == yto)
				state = 141;
		}
		break;
	case 141:
		if (!instance_exists(trapid) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap && (trapid.object_index != obj_pinballtrap || trapid.sprite_index != spr_kingghost_pinball3)))
		{
			state = 0;
			with (trapid)
			{
				switch (object_index)
				{
					case obj_anchortrap:
						sprite_index = spr_kingghost_anchor;
						break;
					case obj_knighttrap:
						sprite_index = spr_kingghost_spike;
						break;
					case obj_tvtrap:
						sprite_index = spr_kingghost_tv;
						break;
					case obj_pinballtrap:
						sprite_index = spr_kingghost_pinball;
						break;
				}
			}
			break;
		}
}
visible = state != 141;
if (distance_to_object(obj_player1) <= 200)
	alpha = true;
if (alpha)
	image_alpha = Approach(image_alpha, target_alpha, 0.01);
if (room == rank_room)
	instance_destroy();
fmod_event_instance_set_3d_attributes(snd_move, x, y);
if (state == 0)
{
	if (!fmod_event_instance_is_playing(snd_loop))
		fmod_event_instance_play(snd_loop);
	fmod_event_instance_set_3d_attributes(snd_loop, x, y);
}
else
	fmod_event_instance_stop(snd_loop, true);
