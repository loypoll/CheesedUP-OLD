function sh_live_execute(args)
{
	if !WC_debug
		return "You do not have permission to use this command";
	if !live_enabled
		return "GMLive is not enabled";
	
	var code = WCscr_allargs(args, 1);
	if !live_execute_string(code)
		return string(live_result);
}
function meta_live_execute()
{
	return
	{
		description: "run code with gmlive",
		arguments: ["code"],
	}
}
