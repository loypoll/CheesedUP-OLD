if (global.horse)
	exit;

var hall = id;
with (obj_player)
{
	if (hall.image_yscale == 1)
	{
		if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, hall) && ((state == states.crouch or character == "S" or character == "M") or state == states.machroll or (state == states.tumble && sprite_index == spr_dive))) or ((state == states.crouchslide or (state == states.tumble && key_down) or state == states.freefall or state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			lastroom = room;
			box = true;
			targetDoor = hall.targetDoor;
			targetRoom = hall.targetRoom;
				
			x = hall.x;
				
			sprite_index = spr_downpizzabox;
			image_index = 0;
			if state != states.gotoplayer
				state = states.door;
			
			other.depth = -10;
			sound_play_3d("event:/sfx/pep/box", x, y);
			mach2 = 0;
			obj_camera.chargecamera = 0;
		}
	}
	if (hall.image_yscale == -1)
	{
		if (((key_up && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 10, hall) && (state == states.normal or state == states.pogo or state == states.jump or state == states.mach1 or state == states.mach2 or state == states.mach3 or state == states.Sjumpprep or (state == states.punch && sprite_index == spr_breakdanceuppercut))) or ((state == states.Sjump or state == states.Sjumpland) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			lastroom = room;
			box = true;
			targetDoor = hall.targetDoor;
			targetRoom = hall.targetRoom;
			vsp = 0;
				
			x = hall.x;
			y = hall.y + 24;
				
			sprite_index = spr_uppizzabox;
			image_index = 0;
			if state != states.gotoplayer
				state = states.door;
			
			sound_play_3d("event:/sfx/pep/box", x, y);
			other.depth = -10;
			other.depth = -8;
			mach2 = 0;
			obj_camera.chargecamera = 0;
		}
	}
}

var door = instance_place(x, y + 1, obj_doorX);
if (door)
	targetDoor = door.door;
else
{
	door = instance_place(x, y - 1, obj_doorX);
	if (door)
		targetDoor = door.door;
}
