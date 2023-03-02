// check if you unlocked everything
ini_open_from_string(obj_savesystem.ini_str);
if ini_key_exists("Ranks", "exit") // checks if you beat the game on this savefile
{
	instance_change(obj_hubelevator, true);
	ini_close();
	exit;
}
ini_close();

event_inherited();
targetRoom = -4;
targetRoom2 = -4;
targetDoor = -4;
key = false;
save = "w1stick";
unlocked = false;
state = states.normal;
depth = 50;
