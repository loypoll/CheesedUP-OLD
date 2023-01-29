if (elitehit <= 0 && pizzahead && destroyable)
{
	instance_create_unique(0, 0, obj_viginoiseyspawner);
	with (instance_create_unique(room_width / 4, room_height + 100, obj_vigilanteboss))
	{
		with (obj_bosscontroller)
		{
			boss_hpsprite = spr_bossfight_vigiHP;
			boss_palette = spr_bossfight_vigipalette;
		}
		instance_destroy(spotlightID);
		pizzahead = true;
		flickertime = 0;
		state = 294;
		sprite_index = spr_playerV_hurt;
		image_index = 0;
		image_speed = 0.35;
		hsp = 0;
		vsp = -18;
		elitehit = 4;
		prevhp = elitehit;
		destroyable = true;
		vigilante_start_attack(0, 5);
		vigilante_add_attack(0, 5, 1);
		vigilante_add_attack(0, 5, 1);
		vigilante_add_attack(0, 5, 9, 25);
		vigilante_add_attack(0, 5, 0, 5);
		vigilante_add_attack(0, 5, 0, 5);
		vigilante_add_attack(0, 5, 8, 20);
		vigilante_start_attack(0, 6);
		vigilante_add_attack(0, 6, 1);
		vigilante_add_attack(0, 6, 1);
		vigilante_add_attack(0, 6, 9, 25);
		vigilante_add_attack(0, 6, 0, 5);
		vigilante_add_attack(0, 6, 0, 5);
		vigilante_add_attack(0, 6, 8, 20);
		vigilante_start_attack(0, 7);
		vigilante_add_attack(0, 7, 6);
		vigilante_add_attack(0, 7, 8, 20);
		vigilante_add_attack(0, 7, 5);
		vigilante_add_attack(0, 7, 4, 200);
		vigilante_add_attack(0, 7, 9, 25);
		vigilante_start_attack(0, 8);
		vigilante_add_attack(0, 8, 1);
		vigilante_add_attack(0, 8, 1);
		vigilante_add_attack(0, 8, 9, 25);
		vigilante_add_attack(0, 8, 1);
		vigilante_add_attack(0, 8, 1);
		vigilante_add_attack(0, 8, 8, 20);
		vigilante_start_attack(0, 9);
		vigilante_add_attack(0, 9, 5);
		vigilante_add_attack(0, 9, 8);
		vigilante_add_attack(0, 9, 9, 25);
	}
}
if (destroyable && elitehit <= 0)
	scr_pepperman_destroy_sounds();
event_inherited();
