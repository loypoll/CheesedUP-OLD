function room_get_tile_layers()
{
	with obj_persistent
	{
		if array_length(room_tiles) == 0
			event_user(0);
		return room_tiles;
	}
}
