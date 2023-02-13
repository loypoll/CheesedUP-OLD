if (grounded && other.sprite_index == spr_swordstone && (state == states.handstandjump || state == 80 || state == 43))
{
	transformationlives = 3;
	fmod_event_one_shot_3d("event:/sfx/knight/start", x, y);
	global.SAGEknighttaken = true;
	momentum = false;
	movespeed = 0;
	other.image_index = 1;
	image_index = 0;
	image_speed = 0.35;
	sprite_index = spr_knightpepstart;
	state = 47;
	hsp = 0;
	vsp = 0;
	notification_push(notifs.knighttaken, [room]);
	create_transformation_tip(lang_get_value("knighttip"), "knight");
}
