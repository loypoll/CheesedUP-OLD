repeat (3)
	create_debris(x, y, 1525);
repeat (3)
	create_debris(x, y, 1973);
with (instance_create(x, y, obj_sausageman_dead))
	sprite_index = other.spr_dead;
