if (!instance_exists(ID))
	instance_destroy();
x = ID.x;
y = ID.y;
image_xscale = ID.image_xscale;
image_index = ID.image_index;
with (ID)
{
	if (state != 126 && state != 134)
	{
		hitboxcreate = false;
		instance_destroy(other);
	}
}
