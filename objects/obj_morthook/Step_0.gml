var _found = false;
with (obj_player)
{
	if (state == 11 || state == 12 || state == 13 || state == 14)
		_found = true;
}
if (_found)
	image_alpha = 1;
else
	image_alpha = 0.5;
