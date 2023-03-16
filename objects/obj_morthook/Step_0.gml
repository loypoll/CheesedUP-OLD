var _found = false;
with (obj_player)
{
	if (state == states.mort or state == states.mortjump or state == states.mortattack or state == states.morthook)
		_found = true;
}
if (_found)
	image_alpha = 1;
else
	image_alpha = 0.5;
