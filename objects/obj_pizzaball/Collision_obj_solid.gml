var _magnet = false;
with (obj_magnet)
{
	if (ballID == other.id)
		_magnet = true;
}
if (!_magnet && state != 148 && state != 137 && state != 4 && bigcheeseID == -4)
{
	x = obj_player1.x;
	y = obj_player1.y;
}
