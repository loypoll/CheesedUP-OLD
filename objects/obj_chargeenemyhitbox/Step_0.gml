if (!instance_exists(baddieID) || !baddieID.thrown || baddieID.state != 138)
{
	instance_destroy();
	exit;
}
x = baddieID.x;
y = baddieID.y;
image_xscale = -baddieID.image_xscale;
