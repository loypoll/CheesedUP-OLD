function sh_liverooms(args)
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
	
	room_set_live(room, WC_liverooms);
}
function meta_liverooms()
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
