scr_create_uparrowhitbox();
depth = 99;

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
for(var i = 0; i < array_length(hub_array); i++)
{
	if room == hub_array[i][1]
	{
		sel = i;
		break;
	}
}
