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
}
function meta_showcollisions()
{
	return
	{
		description: "gives or takes a key from the player",
		arguments: ["<enable>"],
		suggestions: [
			["true", "false"],
		],
	}
}
