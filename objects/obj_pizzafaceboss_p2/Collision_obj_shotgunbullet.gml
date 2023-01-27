if (state != 138)
{
	state = 138;
	stunned = 1000;
	thrown = false;
	hsp = -image_xscale * 8;
	vsp = -4;
	lastattack = 2;
	with (obj_player)
		shotgunAnim = false;
}
instance_destroy(other);
