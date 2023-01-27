depth = 100;
palettes = [["classic", true, 1], ["unfunny", false, 3], ["money", false, 4], ["sage", false, 5], ["blood", false, 6], ["tv", false, 7], ["dark", false, 8], ["shitty", false, 9], ["golden", false, 10], ["garish", false, 11], ["mooney", false, 15], ["funny", false, 12, 4008], ["itchy", false, 12, 473], ["pizza", false, 12, 2889], ["stripes", false, 12, 1672], ["goldemanne", false, 12, 3712], ["bones", false, 12, 3940], ["pp", false, 12, 3915], ["war", false, 12, 844], ["john", false, 12, 3934]];
ini_open_from_string(obj_savesystem.ini_str_options);
for (var i = 1; i < array_length(palettes); i++)
{
	if (ini_read_real("Palettes", palettes[i][0], false))
		palettes[i][1] = true;
}
ini_close();
scr_create_uparrowhitbox();
paletteselect = 0;
with (obj_player1)
{
	if (paletteselect > 2)
	{
		for (i = 0; i < array_length(other.palettes); i++)
		{
			var pal = other.palettes[i][2];
			if (pal == paletteselect && (pal != 12 || other.palettes[i][3] == global.palettetexture))
			{
				other.paletteselect = i;
				break;
			}
		}
	}
}
showtext = false;
alpha = 0;
palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"));
palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]));
