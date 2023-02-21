/// @description get room layers
var layers = layer_get_all();
for (var i = 0; i < array_length(layers); i++)
{
	var tilemap = layer_tilemap_get_id(layers[i]);
	if tilemap != -1
	{
		array_push(room_tiles, {
			layer_id: layers[i],
			layer_name: layer_get_name(layers[i]),
			tilemap: tilemap,
			tileset: tilemap_get_tileset(tilemap)
		});
	}
}

// sort in depth order
array_sort(room_tiles, function(a, b) {
	return layer_get_depth(b) - layer_get_depth(a);
});
