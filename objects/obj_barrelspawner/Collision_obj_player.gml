if (cooldown == 0 && other.state == 111)
{
	instance_destroy(obj_barrel);
	instance_create(x + 50, y - 50, obj_barrel);
	cooldown = 10;
}
