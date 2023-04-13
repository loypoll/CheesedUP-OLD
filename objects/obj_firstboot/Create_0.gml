if live_call() return live_result;

state = 0;
are_you_sure = false;
fade_alpha = 1;

// box
size = 0;
surf = noone;
t = 0;

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");

// check availability
req = -1;
str = "Please connect to the internet.";

net = os_is_network_connected(false);
if net
{
	// https://pto-level-editor.000webhostapp.com/disclaimer
	
	// todo replace base64 with something better
	
	req = http_get(base64_decode("aHR0cHM6Ly9wdG8tbGV2ZWwtZWRpdG9yLjAwMHdlYmhvc3RhcHAuY29tL2Rpc2NsYWltZXI="));
}
else
{
	t = -.5;
	state = 1;
	sound_play("event:/sfx/pto/diagopen");
}
