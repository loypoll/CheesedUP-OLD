function scr_panicbg_init(stop = false)
{
	if live_call() return live_result;
	
	// Initialize wavy panic background whenever timer starts or room changes
	var layers = [];
	
	// Check for all layers that exist
	var room_bgs = room_get_bg_layers();
	for(var i = 0; i < array_length(room_bgs); i++)
	{
		var l = room_bgs[i];
		if layer_get_depth(l.layer_id) <= 0 // trust me it completely breaks the game
			continue;
		array_push(layers, l.layer_id);
	}
	
	// No backgrounds found
	if array_length(layers) == 0
		exit;
	
	// A fix to all of your problems
	array_sort(layers, false);
	
	// Change to panic shader on top layer, reset on bottom layer
	var bottom_id = layers[0];
	var top_id = array_pop(layers);
	
	layer_script_begin(bottom_id, stop ? -1 : scr_panicbg_start);
	layer_script_end(top_id, stop ? -1 : scr_panicbg_end);
}
