if (state != 147 && state != 84)
	exit;
with (other)
{
	var _maxhsp = abs(spd);
	var _dir = sign(spd);
	if (x != other.x)
		_dir = sign(x - other.x);
	spd = _maxhsp * _dir;
}
if (state != 147)
{
	sprite_index = parryspr;
	movespeed = 8;
	state = 147;
	image_index = 0;
}
