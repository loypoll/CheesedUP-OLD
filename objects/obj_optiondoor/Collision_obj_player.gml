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
	if (key_up && grounded && !instance_exists(obj_option) && (state == 0 || state == 103 || state == 104 || state == 58 || state == 121 || state == 99))
	{
		instance_create(x, y, obj_option);
		state = 146;
	}
}
