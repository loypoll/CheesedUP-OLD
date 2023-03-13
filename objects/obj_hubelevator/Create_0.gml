ini_open_from_string(obj_savesystem.ini_str);
if !ini_key_exists("Ranks", "exit") // checks if you beat the game on this savefile
{
	var tr = room;
	if variable_instance_exists(id, "targetRoom")
		tr = targetRoom;
	
	instance_change(obj_door, true);
	targetRoom = tr;
	
	event_perform_object(obj_door, ev_other, ev_room_start);
	ini_close();
	exit;
}
ini_close();

scr_create_uparrowhitbox();
depth = 99;
sprite_index = spr_elevatoropen;

state = 0;
hub_array = [
	["FLOOR 5", tower_5, "E"],
	["FLOOR 4", tower_4, "B"],
	["FLOOR 3", tower_3, "C"],
	["FLOOR 2", tower_2, "E"],
	["FLOOR 1", tower_1, "E"],
	["EXTRA", tower_extra, "G"],
]
targetDoor = "A";
sel = 0;

if (global.panic)
{
	instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy();
}
