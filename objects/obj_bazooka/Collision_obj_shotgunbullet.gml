if (sprite_index == spr_piraneapple_projectile)
{
	instance_destroy(id, false);
	global.combo++;
	global.combotime = 60;
	fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
	with (instance_create(x, y, obj_sausageman_dead))
		sprite_index = spr_piraneapple_dead;
}
else
	instance_destroy();
