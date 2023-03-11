function sh_showcollisions(args)
{
	var togglepanic = !WC_showcollisions;
	if array_length(args) > 1
	{
		if args[1] == "true" or args[1] == "1"
			togglepanic = true;
		else if args[1] == "false" or args[1] == "0"
			togglepanic = false;
		else
			return "Invalid argument: " + args[1];
	}
	WC_showcollisions = togglepanic;
	toggle_collisions(togglepanic);
}
function meta_showcollisions()
{
	return
	{
		description: "toggles viewable collisions",
		arguments: ["<enable>"],
		suggestions: [
			["true", "false"],
		],
	}
}

function toggle_collisions(enable)
{
	global.hidetiles = enable;
	
	with obj_solid visible = enable;
	with obj_slope visible = enable;
	with obj_platform visible = enable;
	with obj_ladder visible = enable;
	with obj_solidhole visible = enable;
	with obj_secretblock visible = enable;
	with obj_secretbigblock visible = enable;
}
