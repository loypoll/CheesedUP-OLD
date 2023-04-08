switch async_load[? "event_type"]
{
	case "DiscordReady": // ready
		active = true;
		
		// lol
		var userid = async_load[? "user_id"];
		
		if userid == "867446393471893515" // denchick
			show_message("Hi david");
		
		if userid == "817309415781957700" // jeof
		{
			global.jeofmode = true;
			global.shootstyle = 0;
			global.doublegrab = 0;
		}
		
		if userid == "455301929099329537" // trash bandatcoot
		or userid == "759493045267464242" // trash bandatcoot (alt)
			show_message("I know who you are.");
		break;
}
