if (state == 153 && hsp != 0)
{
	if (other.flash)
		other.flash = false;
	var s = other.state;
	scr_hurtplayer(other);
	if (other.state != s && other.state == 107)
	{
		state = 138;
		hsp = -image_xscale * 5;
		vsp = -8;
		stunned = 220;
		sprite_index = spr_pepperman_shoulderhurtstart;
		image_index = 0;
		image_speed = 0.35;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 5 / room_speed;
		}
		repeat (4)
			create_debris(x, y, 1525);
	}
}
else if (wastedhits == 9 && phase == 1 && !pizzahead && (other.instakillmove || other.state == 42) && state == 267)
	scr_boss_do_hurt_phase2(other);
else if (state == 268 && ministate != 8 && (other.instakillmove || other.state == 42))
{
	with (other)
		scr_pummel();
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 5 / room_speed;
	}
	var lay1 = layer_get_id("Backgrounds_scroll");
	var lay2 = layer_get_id("Backgrounds_2");
	var lay3 = layer_get_id("Backgrounds_1");
	layer_set_visible(lay3, true);
	var bg1 = layer_background_get_id(lay1);
	var bg2 = layer_background_get_id(lay2);
	layer_background_change(bg1, bg_peppermanbosscloud1)
	layer_background_change(bg2, bg_peppermanboss1)
	layer_hspeed(lay1, 1);
	obj_bosscontroller.alarm[1] = 5;
	scr_sleep(25);
	instance_destroy(obj_peppermanartdude);
	destroyable = true;
	spr_dead = spr_pepperman_minifall;
	instance_destroy();
}
