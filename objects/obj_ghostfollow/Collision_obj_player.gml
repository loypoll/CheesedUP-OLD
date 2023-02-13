if (state != 291 && other.state != states.door && other.state != 146 && other.state != states.comingoutdoor)
{
	notification_push(notifs.johnghost_collide, [room]);
	with (other)
	{
		hitX = x;
		hitY = y;
		state = 291;
		sprite_index = spr_hurt;
		image_speed = 0.35;
	}
	fmod_event_one_shot("event:/sfx/pep/johnghost");
	fadein = false;
	state = 291;
	playerid = other.id;
}
