var p = other.id;
with (instance_create(x, y - 60, obj_grabbiehand))
{
	playerid = p;
	state = 55;
	fake = true;
}
instance_destroy();
