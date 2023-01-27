x = playerid.x;
y = playerid.y;
with (playerid)
{
	if (state != 79 || sprite_index != spr_swingding)
		instance_destroy(other);
}
