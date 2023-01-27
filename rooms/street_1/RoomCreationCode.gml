pal_swap_init_system(8);
global.roommessage = "PIZZA TOWER ISLAND";
if (global.panic)
{
	var lay = layer_get_id("Backgrounds_stillH1");
	layer_background_sprite(layer_background_get_id(lay), 972);
	var lay2 = layer_get_id("Backgrounds_stillH2");
	layer_background_sprite(layer_background_get_id(lay2), 1822);
	var lay3 = layer_get_id("Backgrounds_stillscroll");
	layer_background_sprite(layer_background_get_id(lay3), 3457);
	var lay4 = layer_get_id("Backgrounds_scroll");
	layer_background_sprite(layer_background_get_id(lay4), 3725);
	var lay5 = layer_get_id("Foreground_2");
	layer_background_visible(layer_background_get_id(lay5), true);
}
