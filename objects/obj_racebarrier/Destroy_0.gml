if !sounded
{
	with obj_racebarrier
		sounded = true;
	sound_play(sfx_killenemy);
}
with instance_create(x + 32, y + 32, obj_sausageman_dead)
	sprite_index = spr_towerblocksmall;
ds_list_add(global.saveroom, id);
