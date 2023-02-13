if (other.thrown && state != states.stun)
{
	state = states.stun;
	stunned = 1000;
	thrown = false;
	hsp = -image_xscale * 8;
	vsp = -4;
	if (other.object_index == obj_pizzaheadportrait)
		lastattack = 1;
	else if (other.object_index == obj_pizzafacebrick)
		lastattack = 3;
	instance_destroy(obj_junk);
}
