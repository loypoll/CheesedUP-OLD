if (current_arr > (array_length(content_arr) - 1))
	exit;
scr_sound_multiple("event:/sfx/misc/collect", x, y);
global.heattime += 10;
global.heattime = clamp(global.heattime, 0, 60);
global.combotime += 10;
global.combotime = clamp(global.combotime, 0, 60);
with (obj_camera)
	healthshaketime = 30;
var val = heat_calculate(10);
global.collect += val;
create_collect(x, y, choose(2082, 2084, 2085, 2087, 2083), val);
with (instance_create(x + 16, y, obj_smallnumber))
	number = string(val);
current_arr++;
alarm[0] = count;
