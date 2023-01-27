var p = other.object_index;
with (obj_bosscontroller)
{
	if ((player_hp + instance_number(obj_hpeffect)) < player_maxhp)
	{
		fmod_event_one_shot("event:/sfx/misc/cardcollect");
		var pos = scr_bosscontroller_get_health_pos(player_hp + 1, player_rowmax, player_columnmax, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad);
		with (instance_create(other.x, other.y, obj_hpeffect))
		{
			image_index = other.image_index;
			x_to = pos[0];
			y_to = pos[1];
		}
	}
	else
	{
		with (other)
		{
			scr_sound_multiple("event:/sfx/misc/collect", x, y);
			with (obj_camera)
				healthshaketime = 30;
			var val = 50;
			fmod_event_one_shot("event:/sfx/misc/cardcollect");
			global.extrahats++;
			with (instance_create(x, y, obj_smallnumber))
				number = "+1";
		}
	}
}
instance_destroy();
