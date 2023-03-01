if state == 1
{
	if obj_player1.state != states.normal
	{
		state = 0;
		global.in_menu = false;
	}
	else
	{
		global.in_menu = true;
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
			keyboard_clear(global.key_jump);
			
			state = 2;
			global.in_menu = false;
		}
		else if key_slap2
		{
			keyboard_clear(global.key_slap);
			
			sound_play_centered(sfx_enemyprojectile);
			state = 0;
			
			global.in_menu = false;
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
		}
		instance_create(x, y, obj_fadeout);
	}
	else
	{
		state = 0;
		obj_player1.state = states.normal;
	}
}