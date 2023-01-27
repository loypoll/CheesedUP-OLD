collect -= 10;
global.collect += 10;
scr_sound_multiple("event:/sfx/misc/collect", x, y);
create_collect(x + irandom_range(-40, 40), y + irandom_range(-40, 40), choose(2082, 2084, 2085, 2087, 2083));
if (collect > 0)
	alarm[0] = 5;
else
	instance_destroy();
