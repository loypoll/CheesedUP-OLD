if (image_index == 1 && global.panic == 0 && room != war_13)
{
	with (obj_player)
	{
		if (state == 95 && floor(image_index) == (image_number - 2))
		{
			fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
			GamepadSetVibration(0, 1, 1, 0.9);
			GamepadSetVibration(1, 1, 1, 0.9);
			with (obj_player1)
			{
				lastroom = room;
				sprite_index = spr_Timesup;
				image_index = 0;
				with (obj_camera)
				{
					shake_mag = 10;
					shake_mag_acc = 30 / room_speed;
				}
			}
			if (global.coop == 1)
			{
				with (obj_player2)
				{
					lastroom = room;
					sprite_index = spr_Timesup;
					image_index = 0;
					with (obj_camera)
					{
						shake_mag = 10;
						shake_mag_acc = 30 / room_speed;
					}
				}
			}
			other.image_index = 0;
			ds_list_add(global.saveroom, other.id);
		}
	}
}
if (drop && dropstate != 126)
	exit;
with (obj_player)
{
	if (grounded && (x > (other.x - 160) && x < (other.x + 160)) && key_up && (state == 0 || state == 99 || state == 103 || state == 104 || state == 121) && (global.panic == 1 || global.snickchallenge == 1 || room == war_13))
	{
		global.noisejetpack = false;
		global.startgate = false;
		stop_music();
		scr_do_rank();
	}
}
