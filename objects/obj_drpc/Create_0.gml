active = false;
character = "";

if !np_initdiscord("828220751810265098", true, STEAM ? steam_get_app_id() : np_steam_app_id_empty)
	trace("Failed to start Discord");
