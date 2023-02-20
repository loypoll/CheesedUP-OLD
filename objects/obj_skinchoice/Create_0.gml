if live_call() return live_result;

// animation / background
charshift = [0, 0, 0];
anim_con = 0;
anim_t = 0;
outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
jumpcurve = animcurve_get_channel(curve_jump, "curve1");

surface = -1;
clip_surface = -1;
bg_surf = -1;
bg_pos = 0;

image_speed = 0.35;
depth = -500;

// control
init = false;
postdraw = -1;
draw = -1;
select = -1;
arrowbuffer = -1;

scr_init_input();
global.in_menu = true;

sel = {
	pal: 1,
	char: 0
};
characters = [
	["P", spr_player_idle, spr_peppalette, 1], // character, idle, palette sprite, main color
];

palettes = [];
add_palette = function(palette, entry, texture = noone, name = "PALETTE", description = "loypoll please add details")
{
	array_push(palettes, {
		palette: palette,
		entry: entry,
		texture: texture,
		name: name,
		description: description
	});
}
event_user(0);

// automatically select current palette
if instance_exists(obj_player1)
{
	for(var i = 0; i < array_length(characters); i++)
	{
		if obj_player1.character == characters[i][0]
			sel.char = i;
	}
	for(var i = 0; i < array_length(palettes); i++)
	{
		if global.palettetexture != noone
		{
			if global.palettetexture == palettes[i].texture
				sel.pal = i;
		}
		else if obj_player1.paletteselect == palettes[i].palette
			sel.pal = i;
	}
}
