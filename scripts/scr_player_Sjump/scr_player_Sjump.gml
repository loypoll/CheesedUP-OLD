function scr_player_Sjump()
{
	move = key_right + key_left;
	hsp = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = false;
	machhitAnim = false;
	if (sprite_index == spr_superjump)
	{
		if (steppybuffer > 0)
			steppybuffer--;
		else
		{
			create_particle(x + irandom_range(-25, 25), y + irandom_range(-10, 35), particle.cloudeffect, 0);
			steppybuffer = 8;
		}
		if (piledrivereffect > 0)
			piledrivereffect--;
		else
		{
			with (instance_create(x, y, obj_parryeffect))
			{
				sprite_index = spr_piledrivereffect;
				image_yscale = -1;
			}
			piledrivereffect = 15;
		}
	}
	if ((sprite_index == spr_superjump or sprite_index == spr_superspringplayer) && (character == "N" or character == "P"))
		vsp = sjumpvsp;
	sjumpvsp -= 0.1;
	if (character == "V" && image_index > 3)
		vsp = -11;
	if (sprite_index == spr_player_supersidejump)
	{
		if (a < 25)
			a++;
		hsp = xscale * a;
		vsp = 0;
	}
	if (scr_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		pizzapepper = 0;
		a = 0;
		if (sprite_index == spr_player_supersidejump)
			sprite_index = spr_player_supersidejumpland;
		if (sprite_index == spr_superjump or sprite_index == spr_superspringplayer)
			sprite_index = spr_superjumpland;
		with (obj_camera)
		{
			shake_mag = 10;
			shake_mag_acc = 30 / room_speed;
		}
		with (obj_baddie)
		{
			if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
			{
				image_index = 0;
				if (grounded)
					vsp = -7;
			}
		}
		sound_play_3d("event:/sfx/pep/groundpound", x, y);
		image_index = 0;
		state = states.Sjumpland;
		machhitAnim = false;
	}
	else if ((key_attack2 or input_buffer_slap > 0 or key_slap2) && (character != "N" or noisetype == 0) && sprite_index != spr_superspringplayer && sprite_index != spr_player_Sjumpcancelstart)
	{
		input_buffer_slap = 0;
		image_index = 0;
		sprite_index = spr_player_Sjumpcancelstart;
		sound_play_3d("event:/sfx/pep/superjumpcancel", x, y);
	}
	if (sprite_index == spr_player_Sjumpcancelstart)
	{
		vsp = 0;
		if (move != 0)
			xscale = move;
		if (floor(image_index) == (image_number - 1))
		{
			jumpstop = true;
			vsp = -4;
			flash = true;
			movespeed = 13;
			image_index = 0;
			sprite_index = spr_player_Sjumpcancel;
			state = states.mach3;
			with (instance_create(x, y, obj_crazyrunothereffect))
				image_xscale = other.xscale;
		}
	}
	if (character == "N" && noisetype == 1 && key_jump2)
	{
		jumpstop = false;
		vsp = -15;
		state = states.jump;
		sprite_index = spr_playerN_noisebombspinjump;
		image_index = 0;
		with (instance_create(x, y, obj_jumpdust))
			image_xscale = other.xscale;
	}
	if (character == "N" && noisetype == 1)
	{
		if (move == 1)
			hsp = 3;
		if (move == -1)
			hsp = -3;
	}
	//Jetpack
	if key_attack2 && character == "N" && noisetype == 1
	{
		sound_play_3d(sfx_woag, x, y)
		springsjump = false;
		state = states.Sjumpprep
		image_index = 0
		sprite_index = spr_playerN_jetpackstart
		hsp = 0
		vsp = 0
		if move != 0
			xscale = move
	}
	if (character == "V" && floor(image_index) == (image_number - 1))
	{
		state = states.jump;
		sprite_index = spr_playerV_fall;
	}
	image_speed = 0.5;
	scr_collide_player();
}
