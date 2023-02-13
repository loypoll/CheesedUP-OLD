var _actor = false;
with (obj_player)
{
	if (state == 146)
		_actor = true;
}
if (_actor)
	exit;
with (other)
{
	if (key_up && grounded && !instance_exists(obj_option) && (state == 0 || state == states.mach1 || state == states.mach2 || state == states.pogo || state == 121 || state == 99))
	{
		instance_create(x, y, obj_option);
		state = 146;
	}
}
