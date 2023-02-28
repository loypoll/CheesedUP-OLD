function scr_panicbg_init(stop = false)
{
	if live_call() return live_result;
	
	// Initialize wavy panic background whenever timer starts or room changes
	var layers, layernum = 0;
	
	// Check for all layers that exist
	var room_bgs = room_get_bg_layers();
	for(var i = 0; i < array_length(room_bgs); i++)
	{
		var l = room_bgs[i], bg = l.bg_sprite;
		if layer_get_depth(l.layer_id) <= 0 or bg == bg_treasure // trust me it would completely break the game
			continue;
		layers[layernum++] = l.layer_id;
	}
	
	// No backgrounds found
	if layernum <= 0
		exit;
	
	// A fix to all of your problems
	array_sort(layers, false);
	
	// Change to panic shader on top layer, reset on bottom layer
	var top_id = layers[layernum - 1];
	var bottom_id = layers[0];
	layer_script_begin(bottom_id, stop ? -1 : scr_panicbg_start);
	layer_script_end(top_id, stop ? -1 : scr_panicbg_end);
}
