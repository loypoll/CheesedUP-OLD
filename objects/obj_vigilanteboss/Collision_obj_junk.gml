if (other.thrown && state != 138)
{
	state = 138;
	stunned = 1000;
	thrown = false;
	hsp = -image_xscale * 8;
	vsp = -4;
	instance_destroy(other);
}
