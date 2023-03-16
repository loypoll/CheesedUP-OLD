if live_call() return live_result;

// prep
depth = -200;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;

options_array = [];
function add_option(name, variable, desc = "", drawfunc = noone)
{
	var struct = {
		type: 0,
		value: 0,
		name: name,
		desc: desc,
		opts: [["OFF", false], ["ON", true]],
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_section(name)
{
	var struct = {
		type: 1,
		value: 0,
		name: name
	};
	array_push(options_array, struct);
	return struct;
}
sel = 1;
section = -1;

// options
add_section("Gameplay");
add_option("Remix", "gameplay", "Adds extra quality of life improvements to a bunch of stuff.");
add_option("Attack Style", "attackstyle", "Alternatives to the basic grab move. The original grab is moved to the CHAINSAW button.").opts = [
	["GRAB", 0],
	["KUNG FU", 1]
];

add_section("Visual");
add_option("Panic Background", "panicbg", "Brings back the wavy background effect from old builds when escaping.");
