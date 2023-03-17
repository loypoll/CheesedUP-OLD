if (global.leveltosave == "forest" or global.leveltosave == "street")
	stick = true;
else if (irandom(100) <= 15)
	stick = true;
var r = string_letters(room_get_name(room));
if (sprite_index != spr_gustavo_exitsign or r == "saloon" or room == space_11b or r == "freezer" or r == "chateau")
	stick = false;
if (stick)
	ystart -= 6;
