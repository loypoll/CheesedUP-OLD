function scr_collide_destructibles()
{
	with (obj_player)
	{
		if ((state == states.jump && sprite_index == spr_playerN_noisebombspinjump) or (ghostdash && sprite_index != spr_ghostidle) or state == states.slipbanan or state == states.rideweenie or state == states.trickjump or state == states.ratmountbounce or (state == states.pogo && pogochargeactive == 1))
		{
			var arr = [[xscale, 0], [hsp + xscale, 0], [0, vsp + 1], [0, vsp - 1], [0, 1], [0, -1]];
			for (var i = 0; i < array_length(arr); i++)
			{
				var b = arr[i];
				if (place_meeting(x + b[0], y + b[1], obj_destructibles))
				{
					var num = instance_place_list(x + b[0], y + b[1], obj_destructibles, global.instancelist, false);
					for (var j = 0; j < num; j++)
					{
						var inst = ds_list_find_value(global.instancelist, j);
						if (inst != -4 && inst != -1 && inst != undefined)
						{
							with (inst)
							{
								GamepadSetVibration(0, 0.8, 0.8, 0.5);
								instance_destroy();
							}
						}
					}
					ds_list_clear(global.instancelist);
				}
			}
		}
		if (state == states.trashroll or state == states.boxxedpepspin or ratmount_movespeed >= 12 or state == states.ratmountpunch or state == states.ratmounttumble or state == states.punch or state == states.handstandjump or state == states.ratmountattack or state == states.lungeattack or state == states.cheeseball or state == states.bombpepside or state == states.rocket or state == states.shotgundash or state == states.faceplant or state == states.slipnslide or state == states.tacklecharge or sprite_index == spr_barrelroll or sprite_index == spr_player_barrelslipnslide or state == states.chainsawbump or state == states.mach3 or state == states.knightpep or (state == states.boxxedpepjump && boxxeddash) or (state == states.boxxedpep && boxxeddash) or state == states.machroll or state == states.knightpepslopes or state == states.knightpepattack or state == states.tumble or state == states.hookshot or state == states.shoulderbash)
		{
			if (place_meeting(x + hsp, y, obj_destructibles))
			{
				if (character != "V")
				{
					with (instance_place(x + hsp, y, obj_destructibles))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if (state == states.mach2)
						machpunchAnim = true;
				}
			}
		}
		if (state == states.hurt && thrown == 1)
		{
			if (place_meeting(x - hsp, y, obj_destructibles))
			{
				with (instance_place(x - hsp, y, obj_destructibles))
				{
					GamepadSetVibration(0, 0.8, 0.8, 0.5);
					instance_destroy();
				}
			}
		}
		if ((state == states.knightpep or sprite_index == spr_lonegustavo_groundpoundstart or state == states.ratmountbounce or sprite_index == spr_lonegustavo_groundpound or state == states.jetpackjump or state == states.firemouth or state == states.slipbanan or state == states.superslam or state == states.hookshot or (state == states.bombpepup && bombup_dir == 1)) && vsp > 0)
		{
			var vy = 1;
			if (state == states.ratmountbounce or sprite_index == spr_lonegustavo_groundpoundstart or sprite_index == spr_lonegustavo_groundpound)
				vy = vsp;
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				var num = instance_place_list(x, y + vy, obj_destructibles, global.instancelist, false);
				for (i = 0; i < num; i++)
				{
					with (ds_list_find_value(global.instancelist, i))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
				}
				ds_list_clear(global.instancelist);
				if (state == states.firemouth or state == states.jetpackjump)
				{
					with (instance_place(x, y + vy, obj_tntblock))
					{
						GamepadSetVibration(0, 0.8, 0.8, 0.5);
						instance_destroy();
					}
					if (vsp > -11)
						vsp = -11;
					jumpstop = false;
				}
			}
		}
		if (state == states.firemouth)
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
		
		var num = instance_place_list(x, y + 1, obj_destructibleplatform, global.instancelist, false);
		for (var k = 0; k < num; k++)
		{
			with (ds_list_find_value(global.instancelist, k))
			{
				if (!falling)
					notification_push(notifs.cheeseblock_activate, [room]);
				falling = true;
				if (falling == 1)
					image_speed = 0.35;
			}
		}
		ds_list_clear(global.instancelist);
		
		if (vsp <= 0.5 && (state == states.jump or state == states.ratmountjump or state == states.mach3 or state == states.mach2 or state == states.antigrav or state == states.pogo or (state == states.bombpepup && bombup_dir == -1) or state == states.punch or state == states.climbwall or state == states.fireass or state == states.Sjump or state == states.cheeseballclimbwall or state == states.mach3 or (state == states.punch && (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend))))
		{
			vy = -1;
			if (state == states.punch && (sprite_index == spr_breakdanceuppercut or sprite_index == spr_breakdanceuppercutend))
				vy = vsp;
			if (place_meeting(x, y + vy, obj_destructibles))
			{
				with (instance_place(x, y + vy, obj_destructibles))
				{
					GamepadSetVibration(0, 0.6, 0.6, 0.5);
					instance_destroy();
					with (other)
					{
						if (state != states.Sjump && state != states.punch && state != states.climbwall)
							vsp = 0;
						if (state == states.Sjump)
							vsp = -11;
					}
				}
			}
		}
		if (vsp >= 0 && (state == states.freefall or state == states.superslam or state == states.freefallland or state == states.ratmountgroundpound or (state == states.ratmountbounce && vsp >= 0) or (state == states.slipbanan && vsp >= 10)))
		{
			if (place_meeting(x, y + vsp + 2, obj_destructibles))
			{
				var num = instance_place_list(x, y + vsp + 2, obj_destructibles, global.instancelist, false);
				for (j = 0; j < num; j++)
					instance_destroy(ds_list_find_value(global.instancelist, j));
				ds_list_clear(global.instancelist);
			}
		}
		if (state == states.freefall or state == states.superslam or state == states.freefallland or state == states.slipbanan or (state == states.ratmountbounce && vsp > 0))
		{
			vy = 1;
			if (state == states.ratmountbounce)
				vy = vsp + 4;
			if (place_meeting(x, y + vy, obj_metalblock) && (freefallsmash >= 10 or state == states.slipbanan or state == states.ratmountbounce))
			{
				with (instance_place(x, y + vy, obj_metalblock))
					instance_destroy();
			}
		}
		if (state == states.crouchslide or state == states.machroll or state == states.mach2 or state == states.punch)
		{
			with (instance_place(x + hsp, y, obj_destructibles))
			{
				var _destroyed = false;
				with (other)
				{
					if (place_meeting(x + hsp, y, obj_bigdestructibles) && state != states.crouchslide && state != states.mach2 && state != states.machroll)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					else if (other.object_index != obj_bigdestructibles)
					{
						instance_destroy(other);
						_destroyed = true;
					}
					if (_destroyed && state == states.lungeattack)
						hit_connected = true;
				}
			}
		}
	}
}
