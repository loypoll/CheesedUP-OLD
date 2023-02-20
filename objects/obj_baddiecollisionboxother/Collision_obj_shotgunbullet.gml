if (instance_exists(baddieID))
{
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_slapstar);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_baddiegibs);
	instance_create(x, y, obj_bangeffect);
	instance_destroy(baddieID);
	instance_destroy();
}
