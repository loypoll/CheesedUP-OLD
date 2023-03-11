function sh_live_rooms(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !live_enabled
		return "GMLive is not enabled";
	
	var togglepanic = !WC_liverooms;
	if array_length(args) > 1
	{
		if args[1] == "true" or args[1] == "1"
			togglepanic = true;
		else if args[1] == "false" or args[1] == "0"
			togglepanic = false;
		else
			return "Invalid argument: " + args[1];
	}
	WC_liverooms = togglepanic;
	
	if !WC_liverooms
	{
		for(var i = 0; room_exists(i); i++)
			room_set_live(room, false);
	}
	
	room_set_live(room, WC_liverooms);
	return "Live rooms " + (WC_liverooms ? "ON" : "OFF");
}
function meta_live_rooms()
{
	return
	{
		description: "toggles live rooms with gmlive",
		arguments: ["<enable>"],
		suggestions: [
			["true", "false"],
		],
	}
}
