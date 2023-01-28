function scr_collide_destructibles()
{
	with (obj_player)
	{
		if ((state == 92 && sprite_index == spr_playerN_noisebombspinjump) || (ghostdash && sprite_index != spr_ghostidle) || state == 165 || state == 31 || state == 187 || state == 198 || (state == 58 && pogochargeactive == 1))
		{
			var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
			for (var i = 0; i < array_length(arr); i++)
			{
				var b = arr[i];
				if (place_meeting(x + b[0], y + b[1], obj_destructibles))
				{
					for (var j = 0; j < num; j++)
					{
						var inst = ds_list_find_value(global.instancelist, j);
						if (inst != -4 && inst != -1 && inst != undefined)
						{
							with (inst)
							{
								GamepadSetVibration(0, 0.8, 0.5);
								instance_destroy();
							}
						}
					}
					ds_list_clear(global.instancelist);
				}
			}
		}
		if (state == 211 || state == 34 || ratmount_movespeed >= 12 || state == 259 || state == 201 || state == 80 || state == 42 || state == 193 || state == 43 || state == 21 || state == 53 || state == 184 || state == 70 || state == 124 || state == 94 || state == 20 || sprite_index == spr_barrelroll || sprite_index == spr_player_barrelslipnslide || state == 41 || state == 121 || state == 47 || (state == 35 && boxxeddash) || (state == 33 && boxxeddash) || state == 65 || state == 38 || state == 48 || state == 5 || state == 19 || state == 153)
		{
			if (place_meeting(x + hsp, y, obj_destructibles))
			{
				if (character != "V")
				{
					with (instance_place(x + hsp, y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.5);
						instance_destroy();
					}
					if (state == 104)
						machpunchAnim = true;
				}
			}
		}
		if (state == 107 && thrown == 1)
		{
			if (place_meeting(x - hsp, y, obj_destructibles))
			{
				with (instance_place(x - hsp, y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.5);
					instance_destroy();
				}
			}
		}
		if ((state == 47 || sprite_index == spr_lonegustavo_groundpoundstart || state == 198 || sprite_index == spr_lonegustavo_groundpound || state == 254 || state == 10 || state == 165 || state == 76 || state == 19 || (state == 54 && bombup_dir == 1)) && vsp > 0)
		{
			var vy = 1;
			if (state == 198 || sprite_index == spr_lonegustavo_groundpoundstart || sprite_index == spr_lonegustavo_groundpound)
				vy = vsp;
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				num = instance_place_list(x, y + vy, obj_destructibles, global.instancelist, false);
				for (i = 0; i < num; i++)
				{
					with (ds_list_find_value(global.instancelist, i))
					{
						GamepadSetVibration(0, 0.8, 0.5);
						instance_destroy();
					}
				}
				ds_list_clear(global.instancelist);
				if (state == 10 || state == 254)
				{
					with (instance_place(x, y + vy, obj_tntblock))
					{
						GamepadSetVibration(0, 0.8, 0.5);
						instance_destroy();
					}
					if (vsp > -11)
						vsp = -11;
					jumpstop = false;
				}
			}
		}
		if (state == 10)
		{
			with (instance_place(x + xscale, y, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y + vsp, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y + 1, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
					other.vsp = -11;
				jumpstop = false;
			}
			with (instance_place(x, y - 1, obj_tntblock))
			{
				instance_destroy();
				if (other.vsp > -11)
					other.vsp = -11;
				jumpstop = false;
			}
		}
		num = instance_place_list(x, y + 1, 811, global.instancelist, false);
		for (var k = 0; k < num; k++)
		{
			with (ds_list_find_value(global.instancelist, k))
			{
				if (!falling)
					notification_push(33, [room]);
				falling = true;
				if (falling == 1)
					image_speed = 0.35;
			}
		}
		ds_list_clear(global.instancelist);
		if (vsp <= 0.5 && (state == 92 || state == 192 || state == 121 || state == 104 || state == 265 || state == 58 || (state == 54 && bombup_dir == -1) || state == 80 || state == 37 || state == 9 || state == 97 || state == 22 || state == 121 || (state == 80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
		{
			vy = -1;
			if (state == 80 && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))
				vy = vsp;
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				with (instance_place(x, y + vy, obj_destructibles))
				{
					GamepadSetVibration(0, 0.6, 0.5);
					instance_destroy();
					with (other)
					{
						if (state != 97 && state != 80 && state != 37)
							vsp = 0;
						if (state == 97)
							vsp = -11;
					}
				}
			}
		}
		if (vsp >= 0 && (state == 108 || state == 76 || state == 111 || state == 197 || (state == 198 && vsp >= 0) || (state == 165 && vsp >= 10)))
		{
			if (place_meeting(x, y + vsp + 2, obj_destructibles))
			{
				num = instance_place_list(x, y + vsp + 2, obj_destructibles, global.instancelist, false);
				for (j = 0; j < num; j++)
					instance_destroy(ds_list_find_value(global.instancelist, j));
				ds_list_clear(global.instancelist);
			}
		}
		if (state == 108 || state == 76 || state == 111 || state == 165 || (state == 198 && vsp > 0))
		{
			vy = 1;
			if (state == 198)
				vy = vsp + 4;
			if (place_meeting(x, y + vy, obj_metalblock) && (freefallsmash >= 10 || state == 165 || state == 198))
			{
				with (instance_place(x, y + vy, obj_metalblock))
					instance_destroy();
			}
		}
		if (state == 102 || state == 65 || state == 104 || state == 80)
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				var _destroyed = false;
				with (other)
				{
					if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != 102 && state != 104 && state != 65)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					else if (other.object_index != obj_bigdestructibles)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					if (_destroyed && state == 43)
						hit_connected = true;
				}
			}
		}
	}
}
