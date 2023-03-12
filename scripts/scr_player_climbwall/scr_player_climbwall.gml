function scr_player_climbwall()
{
	switch (character)
	{
		default:
			if character != "N" or noisetype == 0
			{
				if (windingAnim < 200)
					windingAnim++;
				move = key_left + key_right;
				suplexmove = false;
				vsp = -wallspeed;
			
				if instance_exists(obj_fadeout) && y < -50
					vsp = 0;
			
				if place_meeting(x + xscale, y, obj_unclimbablewall)
				{
					wallspeed -= grav / 2;
					if wallspeed > 6
						wallspeed = 6;
				
					if grounded
					{
						state = states.normal
						movespeed = 0
					}
				
					var mv = wallspeed / 16;
					image_speed = lerp(0.35, 0.75, clamp(mv, 0, 1));
				}
				else
				{
					if (wallspeed < 20)
						wallspeed += 0.15;
					if (wallspeed < 0)
					{
						if (mach4mode == 0)
							movespeed += 0.2;
						else
							movespeed += 0.4;
					}
					image_speed = 0.6;
				
					if (wallspeed < 0)
					{
						if (!scr_solid(x + xscale, y + 50))
							vsp = 0;
					}
				}
				crouchslideAnim = true;
				if (vsp < -5)
					sprite_index = spr_machclimbwall;
				else
					sprite_index = spr_player_clingwall;
				if (skateboarding)
				{
					if (wallspeed < 0)
						wallspeed = 6;
					sprite_index = spr_player_clownwallclimb;
				}
				if (grabclimbbuffer > 0)
					grabclimbbuffer--;
				if (!key_attack && !skateboarding && grabclimbbuffer == 0)
				{
					state =	states.normal;
					movespeed = 0;
					railmovespeed = 6;
					raildir = -xscale;
				}
				if (verticalbuffer <= 0 && (wallspeed > 0 or place_meeting(x + xscale, y, obj_unclimbablewall)) && !scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway) && !place_meeting(x, y - 12, obj_verticalhallway))
				{
					trace("climbwall out");
					with instance_create(x, y, obj_jumpdust)
						image_xscale = REMIX ? other.xscale : 1;
				
					ledge_bump(32);
				
					if (wallspeed >= 6 && wallspeed < 12) || skateboarding
					{
						state = states.mach2;
						movespeed = wallspeed;
					}
					else if wallspeed >= 12
					{
						state = states.mach3;
						sprite_index = spr_mach4;
						movespeed = wallspeed;
					}
					movespeed = max(wallspeed, 6);
				
					if REMIX
					{
						if vsp < 0
						{
							for(var i = 0; i < 32; i++)
							{
								if scr_solid(x + xscale, y + i + 1)
								{
									y += i;
									break;
								}
							}
						}
						hsp = movespeed * xscale;
					}
					vsp = 0;
				}
				if (wallspeed < 0 && check_wall(x, y + 12))
					wallspeed = 0;
				if (input_buffer_jump > 8)
				{
					sound_play_3d("event:/sfx/pep/jump", x, y);
					input_buffer_jump = 0;
					key_jump = false;
					movespeed = 10;
					railmovespeed = 0;
					state = states.mach2;
					image_index = 0;
					sprite_index = spr_walljumpstart;
					if (skateboarding)
						sprite_index = spr_clownjump;
					vsp = -11;
					xscale *= -1;
					jumpstop = false;
					walljumpbuffer = 4;
				}
				if (state != states.mach2 && verticalbuffer <= 0 && check_wall(x, y - 1) && scr_solid(x + xscale, y) && !place_meeting(x, y - 1, obj_verticalhallway) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
				{
					trace("climbwall hit head");
					if (!skateboarding)
					{
						sprite_index = spr_superjumpland;
						sound_play_3d("event:/sfx/pep/groundpound", x, y);
						image_index = 0;
						state = states.Sjumpland;
						machhitAnim = false;
					
						if REMIX with obj_camera
						{
							shake_mag = 3;
							shake_mag_acc = 4 / room_speed;
						}
					}
					else if (!key_jump)
					{
						state = states.bump;
						hsp = -2.5 * xscale;
						vsp = -3;
						mach2 = 0;
						image_index = 0;
					}
				}
				if REMIX && state == states.climbwall
				{
					if (place_meeting(x + xscale, y, obj_destructibles) && input_buffer_slap > 0 && shotgunAnim == false && !global.pistol)
					{
						input_buffer_slap = 0;
						sprite_index = spr_suplexdash;
						suplexmove = true;
						fmod_event_instance_play(suplexdashsnd);
						state = states.handstandjump;
						movespeed = max(wallspeed, 5);
						image_index = 0;
					}
				}
				if (steppybuffer > 0)
					steppybuffer--;
				else
				{
					create_particle(x + (xscale * 10), y + 43, particle.cloudeffect, 0);
					steppybuffer = 10;
				}
			}
			else // pogo goise
			{
				hsp = 0;
				if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
					sprite_index = spr_playerN_wallcling;
				if (sprite_index == spr_playerN_wallcling)
					vsp = 2;
				else
					vsp = 0;
				wallclingcooldown = 0;
				if (floor(image_index) == (image_number - 1) || !key_jump2)
				{
					vsp = -15;
					state = states.jump;
					sprite_index = spr_playerN_jump;
					image_index = 0;
				}
				if (key_jump)
				{
					vsp = -15;
					state = states.jump;
					sprite_index = spr_playerN_jump;
					image_index = 0;
				}
				image_speed = 0.35;
			}
			break;
		
		case "V":
			if (windingAnim < 200)
				windingAnim++;
			move = key_left + key_right;
			suplexmove = false;
			vsp = -wallspeed;
			if (wallspeed < 24 && move == xscale)
				wallspeed += 0.1;
			crouchslideAnim = true;
			sprite_index = spr_machclimbwall;
			if (grabclimbbuffer > 0)
				grabclimbbuffer--;
			if (!key_attack && grabclimbbuffer == 0)
			{
				state = states.normal
				movespeed = 0;
			}
			if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles) && (!place_meeting(x + sign(hsp), y, obj_slope) || scr_solid_slope(x + sign(hsp), y)) && !place_meeting(x - sign(hsp), y, obj_slope))
			{
				sprite_index = spr_superjumpland;
				sound_play_3d("event:/sfx/pep/groundpound", x, y);
				image_index = 0;
				state = states.Sjumpland;
				machhitAnim = false;
			}
			if (!scr_solid(x + xscale, y) && !place_meeting(x, y, obj_verticalhallway))
			{
				instance_create(x, y, obj_jumpdust);
				vsp = 0;
				if (movespeed >= 6)
					state = states.mach2;
				if (movespeed >= 12)
				{
					state = states.mach3;
					sprite_index = spr_mach4;
				}
			}
			if (input_buffer_jump > 8)
			{
				input_buffer_jump = 0;
				movespeed = 8;
				state = states.mach2;
				image_index = 0;
				sprite_index = spr_walljumpstart;
				vsp = -11;
				xscale *= -1;
				jumpstop = false;
			}
			if ((grounded && wallspeed <= 0) || wallspeed <= 0)
			{
				state = states.jump;
				sprite_index = spr_fall;
			}
			image_speed = 0.6;
			if (!instance_exists(obj_cloudeffect))
				instance_create(x, y + 43, obj_cloudeffect);
			break;
	}
}
