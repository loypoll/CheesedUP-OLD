if (!instance_exists(ID))
{
	instance_destroy();
	exit;
}
if (ID.state != 128)
{
	ID.hitboxcreate = false;
	instance_destroy();
}
x = ID.x + (ID.image_xscale * 12);
y = ID.y;
image_xscale = ID.image_xscale;
