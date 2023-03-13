if state == 1
{
	if obj_player1.state != states.normal
	{
		state = 0;
		close_menu();
	}
	else
	{
		open_menu();
		scr_getinput(true);
		
		var move = -key_up2 + key_down2;
		if move != 0
		{
			var selprev = sel;
			sel = clamp(sel + move, 0, array_length(hub_array) - 1);
			
			if sel != selprev
				sound_play(sfx_step);
		}
		
		if key_jump
		{
			state = 2;
			close_menu();
		}
		else if key_slap2 or keyboard_check_pressed(vk_escape)
		{
			sound_play_centered(sfx_enemyprojectile);
			state = 0;
			
			close_menu();
		}
	}
}

if state == 2
{
	obj_player1.targetRoom = hub_array[sel][1];
	obj_player1.targetDoor = hub_array[sel][2];
	
	if obj_player1.targetRoom != room
	{
		state = 3;
		sound_play(sfx_door);
		
		obj_camera.chargecamera = 0;
		with obj_player1
		{
			lastroom = room;
			sprite_index = spr_lookdoor;
			image_index = 0;
			state = states.door;
			mach2 = 0;
			
			if REMIX
			{
				smoothx = x - (other.x + 50);
				x = other.x + 50;
			}
		}
		instance_create(x, y, obj_fadeout);
	}
	else
	{
		state = 0;
		obj_player1.state = states.normal;
	}
}
