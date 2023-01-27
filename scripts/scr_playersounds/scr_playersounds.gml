function scr_playersounds()
{
	with (obj_player)
	{
		if (instance_exists(obj_pizzaface))
		{
			if (!fmod_event_instance_is_playing(global.snd_pizzafacemoving))
				fmod_event_instance_play(global.snd_pizzafacemoving);
			fmod_event_instance_set_3d_attributes(global.snd_pizzafacemoving, obj_pizzaface.x, obj_pizzaface.y);
		}
		else
			fmod_event_instance_stop(global.snd_pizzafacemoving, true);
		if (state == 146 && sprite_index == spr_firemouthend)
		{
			if (image_index > 8 && !fmod_event_instance_is_playing(burpsnd))
			{
				fmod_event_instance_play(burpsnd);
				fmod_event_instance_set_3d_attributes(burpsnd, x, y);
			}
		}
		if (state != 150 && sprite_index != spr_knightpepstart && state != 52 && state != 61 && state != 297 && state != 296 && state != 112 && state != 98 && state != 59 && state != 89 && state != 9)
		{
			if (!scr_transformationcheck())
			{
				if (!transformationsnd)
				{
					transformationsnd = true;
					if (irandom(100) <= 70)
						fmod_event_instance_play(snd_voicetransfo);
					fmod_event_one_shot_3d("event:/sfx/misc/transfo", x, y);
				}
			}
			else if (transformationsnd)
			{
				transformationsnd = false;
				if (irandom(100) <= 70)
					fmod_event_instance_play(snd_voiceouttransfo);
				fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y);
			}
		}
		fmod_event_instance_set_3d_attributes(snd_voiceouttransfo, x, y);
		fmod_event_instance_set_3d_attributes(snd_voicetransfo, x, y);
		fmod_event_instance_set_3d_attributes(snd_voiceok, x, y);
		fmod_event_instance_set_3d_attributes(snd_voicehurt, x, y);
		fmod_event_instance_set_3d_attributes(snd_uppercut, x, y);
		fmod_event_instance_set_3d_attributes(snd_dive, x, y);
		fmod_event_instance_set_3d_attributes(snd_crouchslide, x, y);
		fmod_event_instance_set_3d_attributes(rollgetupsnd, x, y);
		fmod_event_instance_set_3d_attributes(animatronicsnd, x, y);
		fmod_event_instance_set_3d_attributes(snd_dashpad, x, y);
		fmod_event_instance_set_3d_attributes(gallopingsnd, x, y);
		if (state == 108 || state == 122 || (state == 76 || (state == 61 && tauntstoredstate == 76)))
		{
			if (!fmod_event_instance_is_playing(freefallsnd))
				fmod_event_instance_play(freefallsnd);
			fmod_event_instance_set_paused(freefallsnd, false);
			fmod_event_instance_set_3d_attributes(freefallsnd, x, y);
		}
		else
			fmod_event_instance_stop(freefallsnd, true);
		if (state == 104 || state == 121 || state == 37 || state == 184)
		{
			fmod_event_instance_set_paused(machsnd, false);
			if (!fmod_event_instance_is_playing(machsnd))
				fmod_event_instance_play(machsnd);
			var s = 0;
			if (state == 104 && sprite_index == spr_mach1 && grounded)
				s = 1;
			else if ((state == 104 && sprite_index == spr_mach) || state == 37)
				s = 2;
			else if (state == 121 && sprite_index != spr_crazyrun)
				s = 3;
			else if (sprite_index == spr_crazyrun)
				s = 4;
			if (state == 184)
				s = 4;
			fmod_event_instance_set_3d_attributes(machsnd, x, y);
			fmod_event_instance_set_parameter(machsnd, "state", s, true);
		}
		else
			fmod_event_instance_stop(machsnd, true);
		if ((state == 38 && grounded && vsp > 0) || state == 78 || (state == 211 && grounded && vsp > 0 && sprite_index == spr_player_trashslide))
		{
			if (!fmod_event_instance_is_playing(knightslidesnd))
				fmod_event_instance_play(knightslidesnd);
			fmod_event_instance_set_3d_attributes(knightslidesnd, x, y);
		}
		else if (fmod_event_instance_is_playing(knightslidesnd))
			fmod_event_instance_stop(knightslidesnd, true);
		if (state == 99)
		{
			if (!fmod_event_instance_is_playing(superjumpsnd))
			{
				fmod_event_instance_set_parameter(superjumpsnd, "state", 0, true);
				fmod_event_instance_play(superjumpsnd);
			}
		}
		else if (state == 97)
			fmod_event_instance_set_parameter(superjumpsnd, "state", 1, true);
		else if (state != 97)
		{
			if (fmod_event_instance_is_playing(superjumpsnd) && fmod_event_instance_get_parameter(superjumpsnd, "state") < 1)
				fmod_event_instance_stop(superjumpsnd, true);
			else if (!fmod_event_instance_is_playing(superjumpsnd))
				fmod_event_instance_set_parameter(superjumpsnd, "state", 0, true);
		}
		if (sprite_index == spr_player_Sjumpcancelstart)
			fmod_event_instance_stop(superjumpsnd, true);
		if (fmod_event_instance_is_playing(superjumpsnd))
			fmod_event_instance_set_3d_attributes(superjumpsnd, x, y);
		if (sprite_index == spr_tumblestart || sprite_index == spr_tumble)
		{
			if (!fmod_event_instance_is_playing(tumblesnd))
			{
				fmod_event_instance_play(tumblesnd);
				fmod_event_instance_set_parameter(tumblesnd, "state", 0, true);
				if (sprite_index == spr_tumblestart)
					tumbleintro = true;
			}
			if (sprite_index == spr_tumble && !tumbleintro)
				fmod_event_instance_set_parameter(tumblesnd, "state", 1, true);
			fmod_event_instance_set_3d_attributes(tumblesnd, x, y);
		}
		else
		{
			if (fmod_event_instance_is_playing(tumblesnd))
			{
				fmod_event_instance_set_parameter(tumblesnd, "state", 2, true);
				fmod_event_instance_set_3d_attributes(tumblesnd, x, y);
			}
			tumbleintro = false;
		}
		if (sprite_index == spr_player_machroll || sprite_index == spr_player_backslide || sprite_index == spr_player_backslideland)
		{
			if (!fmod_event_instance_is_playing(machrollsnd))
				fmod_event_instance_play(machrollsnd);
			fmod_event_instance_set_3d_attributes(machrollsnd, x, y);
		}
		else
			fmod_event_instance_stop(machrollsnd, true);
		if (fmod_event_instance_is_playing(suplexdashsnd))
		{
			if (state != 42)
				fmod_event_instance_stop(suplexdashsnd, true);
			fmod_event_instance_set_3d_attributes(suplexdashsnd, x, y);
		}
		if (state == 211 && sprite_index == spr_player_corpsesurf && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(gravecorpsesnd))
				fmod_event_instance_play(gravecorpsesnd);
			fmod_event_instance_set_3d_attributes(gravecorpsesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(gravecorpsesnd, true);
		if (state == 116 && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(barrelslidesnd))
				fmod_event_instance_play(barrelslidesnd);
			fmod_event_instance_set_3d_attributes(barrelslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(barrelslidesnd, true);
		if (state == 94 && sprite_index == spr_currentplayer)
		{
			if (!fmod_event_instance_is_playing(waterslidesnd))
				fmod_event_instance_play(waterslidesnd);
			fmod_event_instance_set_3d_attributes(waterslidesnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(waterslidesnd, true);
		if (state == 214)
		{
			if (!fmod_event_instance_is_playing(mrpinchsnd))
				fmod_event_instance_play(mrpinchsnd);
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 0, true);
			fmod_event_instance_set_3d_attributes(mrpinchsnd, x + hsp, y + vsp);
		}
		else if (fmod_event_instance_is_playing(mrpinchsnd))
		{
			fmod_event_instance_set_parameter(mrpinchsnd, "state", 1, true);
			fmod_event_instance_set_3d_attributes(mrpinchsnd, x + hsp, y + vsp);
		}
		if (hamkuffID != -4 && instance_exists(hamkuffID) && !launched)
		{
			if (!fmod_event_instance_is_playing(hamkuffsnd))
				fmod_event_instance_play(hamkuffsnd);
			if (launch)
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 1, true);
			else
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 0, true);
			fmod_event_instance_set_3d_attributes(hamkuffsnd, x + hsp, y + vsp);
		}
		else
		{
			if (fmod_event_instance_is_playing(hamkuffsnd))
			{
				fmod_event_instance_set_parameter(hamkuffsnd, "state", 2, true);
				fmod_event_instance_set_3d_attributes(hamkuffsnd, x + hsp, y + vsp);
			}
			hamkuffID = -4;
		}
		if ((state == 191 || state == 192) && ratmount_movespeed >= 12 && (sprite_index == spr_player_ratmountattack || sprite_index == spr_player_ratmountmach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dash || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_lonegustavo_dashjump))
		{
			if (!fmod_event_instance_is_playing(ratmountmachsnd))
				fmod_event_instance_play(ratmountmachsnd);
			s = 0;
			if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_player_ratmountdashjump || sprite_index == spr_lonegustavo_dashjump)
				s = 1;
			fmod_event_instance_set_parameter(ratmountmachsnd, "state", s, true);
			if (grounded)
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 1, true);
			else
				fmod_event_instance_set_parameter(ratmountmachsnd, "ground", 0, true);
			fmod_event_instance_set_3d_attributes(ratmountmachsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountmachsnd, true);
		if (state == 259)
		{
			if (!fmod_event_instance_is_playing(ratmountpunchsnd))
				fmod_event_instance_play(ratmountpunchsnd);
			fmod_event_instance_set_3d_attributes(ratmountpunchsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountpunchsnd, true);
		if (state == 198 && sprite_index == spr_player_ratmountwalljump)
		{
			if (!fmod_event_instance_is_playing(ratmountgroundpoundsnd))
				fmod_event_instance_play(ratmountgroundpoundsnd);
			s = 0;
			if (instance_exists(superslameffectid))
				s = 1;
			fmod_event_instance_set_parameter(ratmountgroundpoundsnd, "state", s, true);
			fmod_event_instance_set_3d_attributes(ratmountgroundpoundsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(ratmountgroundpoundsnd, true);
		if (state == 225)
		{
			if (!fmod_event_instance_is_playing(animatronicsnd))
				fmod_event_instance_play(animatronicsnd);
			fmod_event_instance_set_3d_attributes(animatronicsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(animatronicsnd, true);
		if (instance_exists(obj_brickball))
		{
			if (!fmod_event_instance_is_playing(ratmountballsnd))
				fmod_event_instance_play(ratmountballsnd);
			fmod_event_instance_set_3d_attributes(ratmountballsnd, obj_brickball.x + obj_brickball.hsp, obj_brickball.y + obj_brickball.vsp);
		}
		else
			fmod_event_instance_stop(ratmountballsnd, true);
		if (instance_exists(obj_balloongrabbableeffect))
		{
			if (!fmod_event_instance_is_playing(ratdeflatesnd))
				fmod_event_instance_play(ratdeflatesnd);
			fmod_event_instance_set_3d_attributes(ratdeflatesnd, obj_balloongrabbableeffect.x, obj_balloongrabbableeffect.y);
		}
		else
			fmod_event_instance_stop(ratdeflatesnd, true);
		if (state == 21 && grounded && vsp > 0)
		{
			if (!fmod_event_instance_is_playing(cheeseballsnd))
				fmod_event_instance_play(cheeseballsnd);
			fmod_event_instance_set_3d_attributes(cheeseballsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(cheeseballsnd, true);
		if (state == 31 && abs(hsp) > 8 && grounded)
		{
			if (!fmod_event_instance_is_playing(gallopingsnd))
				fmod_event_instance_play(gallopingsnd);
		}
		else if (fmod_event_instance_is_playing(gallopingsnd))
			fmod_event_instance_stop(gallopingsnd, true);
		if (state == 34)
		{
			if (!fmod_event_instance_is_playing(boxxedspinsnd))
				fmod_event_instance_play(boxxedspinsnd);
			fmod_event_instance_set_3d_attributes(boxxedspinsnd, x + hsp, y + vsp);
		}
		else
			fmod_event_instance_stop(boxxedspinsnd, true);
		if (fmod_event_instance_is_playing(pizzapeppersnd))
		{
			if (state == 254)
			{
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
				fmod_event_instance_set_3d_attributes(pizzapeppersnd, x + hsp, y + vsp);
			}
			else
				fmod_event_instance_set_parameter(pizzapeppersnd, "state", 1, true);
		}
		if (state == 16 && sprite_index != spr_ghostidle)
		{
			if (!fmod_event_instance_is_playing(ghostspeedsnd))
				fmod_event_instance_play(ghostspeedsnd);
			s = 0;
			if (ghostpepper == 1)
				s = 1;
			else if (ghostpepper == 2)
				s = 2;
			else if (ghostpepper >= 3)
				s = 3;
			fmod_event_instance_set_3d_attributes(ghostspeedsnd, x, y);
			fmod_event_instance_set_parameter(ghostspeedsnd, "state", s, true);
		}
		else if (fmod_event_instance_is_playing(ghostspeedsnd))
			fmod_event_instance_stop(ghostspeedsnd, false);
	}
}
