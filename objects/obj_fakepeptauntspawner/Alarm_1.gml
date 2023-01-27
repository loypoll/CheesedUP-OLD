with (obj_fakepepprojectile)
{
	if (spawnerID == other.id)
	{
		create_particle(x, y, 9);
		instance_destroy();
	}
}
instance_destroy();
