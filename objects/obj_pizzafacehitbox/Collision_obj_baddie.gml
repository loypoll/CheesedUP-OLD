if (!instance_exists(baddieID))
	exit;
var slam = enemy_is_superslam(other.id) && baddieID.superslambuffer <= 0;
var _enemy = other.id;
if (baddieID != other.id && (other.thrown || slam) && other.state != 137 && baddieID.flickertime <= 0 && baddieID.on_y && baddieID.state != 137)
{
	with (baddieID)
	{
		state = 138;
		stunned = 1000;
		thrown = false;
		if (_enemy.hsp != 0)
			image_xscale = -sign(_enemy.hsp);
		else
			image_xscale = _enemy.image_xscale;
		hsp = -image_xscale * 8;
		vsp = -4;
	}
	with (other)
	{
		if (!slam)
			instance_destroy();
		else
			other.baddieID.superslambuffer = 80;
		instance_create(x, y, obj_bangeffect);
	}
}
