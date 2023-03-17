if (global.horse)
	exit;
with (obj_player)
{
	if (other.image_yscale == 1)
	{
		if (((key_down && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other) && ((state == states.crouch or character == "S" or character == "M") or state == states.machroll or (state == states.tumble && sprite_index == spr_dive))) or ((state == states.crouchslide or (state == states.tumble && key_down) or state == states.freefall or state == states.freefallland) && !place_meeting(x, y + 1, obj_destructibles) && place_meeting(x, y + 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			obj_player1.lastroom = room;
			obj_player2.lastroom = room;
			other.depth = -10;
			sound_play_3d("event:/sfx/pep/box", x, y);
			obj_player1.box = true;
			obj_player2.box = true;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			obj_player1.targetDoor = other.targetDoor;
			obj_player1.targetRoom = other.targetRoom;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			if (global.coop == 1)
			{
				var _box = other.id;
				with (obj_player)
				{
					x = _box.x;
					y = _box.y - 76;
				}
				obj_player1.sprite_index = obj_player1.spr_downpizzabox;
				obj_player1.image_index = 0;
				obj_player1.state = states.door;
				obj_player2.sprite_index = obj_player2.spr_downpizzabox;
				obj_player2.image_index = 0;
				if (obj_player2.state != states.gotoplayer)
					obj_player2.state = states.door;
			}
			else
			{
				sprite_index = spr_downpizzabox;
				image_index = 0;
				state = states.door;
			}
		}
	}
	if (other.image_yscale == -1)
	{
		if (((key_up && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 10, other) && (state == states.normal or state == states.pogo or state == states.jump or state == states.mach1 or state == states.mach2 or state == states.mach3 or state == states.Sjumpprep or (state == states.punch && sprite_index == spr_breakdanceuppercut))) or ((state == states.Sjump or state == states.Sjumpland) && !place_meeting(x, y - 1, obj_destructibles) && place_meeting(x, y - 1, other))) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			obj_player1.lastroom = room;
			obj_player2.lastroom = room;
			sound_play_3d("event:/sfx/pep/box", x, y);
			other.depth = -10;
			obj_player1.box = true;
			obj_player2.box = true;
			other.depth = -8;
			mach2 = 0;
			obj_camera.chargecamera = 0;
			x = other.x;
			y = other.y + 24;
			obj_player1.targetDoor = other.targetDoor;
			obj_player1.targetRoom = other.targetRoom;
			obj_player2.targetDoor = other.targetDoor;
			obj_player2.targetRoom = other.targetRoom;
			obj_player1.vsp = 0;
			obj_player2.vsp = 0;
			if (global.coop == 1)
			{
				_box = other.id;
				with (obj_player)
				{
					x = _box.x;
					y = _box.y + 24;
				}
				obj_player1.sprite_index = obj_player1.spr_uppizzabox;
				obj_player1.image_index = 0;
				obj_player1.state = states.door;
				obj_player2.sprite_index = obj_player2.spr_uppizzabox;
				obj_player2.image_index = 0;
				if (obj_player2.state != states.gotoplayer)
					obj_player2.state = states.door;
			}
			else
			{
				sprite_index = spr_uppizzabox;
				image_index = 0;
				state = states.door;
			}
		}
	}
}
if (place_meeting(x, y + 1, obj_doorA) or place_meeting(x, y - 1, obj_doorA))
	targetDoor = "A";
if (place_meeting(x, y + 1, obj_doorB) or place_meeting(x, y - 1, obj_doorB))
	targetDoor = "B";
if (place_meeting(x, y + 1, obj_doorC) or place_meeting(x, y - 1, obj_doorC))
	targetDoor = "C";
if (place_meeting(x, y + 1, obj_doorD) or place_meeting(x, y - 1, obj_doorD))
	targetDoor = "D";
if (place_meeting(x, y + 1, obj_doorE) or place_meeting(x, y - 1, obj_doorE))
	targetDoor = "E";
if (place_meeting(x, y + 1, obj_doorF) or place_meeting(x, y - 1, obj_doorF))
	targetDoor = "F";
if (place_meeting(x, y + 1, obj_doorG) or place_meeting(x, y - 1, obj_doorG))
	targetDoor = "G";
