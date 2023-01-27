if ((other.state != 5 || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && other.state != 84 && other.state != 61 && other.state != 106 && other.y > other.yprevious && ((!other.isgustavo && other.y <= (y + 10)) || (other.isgustavo && other.y < y)))
{
	if (!other.isgustavo)
	{
		if (other.state == 80)
			other.movespeed = abs(other.hsp);
		other.y = y - 49;
		other.state = 78;
	}
	else if (other.state != 202)
	{
		with (other)
		{
			if (brick == 1)
			{
				with (instance_create(x, y, obj_brickcomeback))
					wait = true;
			}
			with (instance_create(x, y - 5, obj_parryeffect))
			{
				fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
				sprite_index = spr_grabhangeffect;
				image_speed = 0.35;
			}
			brick = false;
			with (obj_camera)
			{
				followtarget = other.id;
				state = 299;
			}
		}
		other.y = y + 8;
		other.state = 202;
	}
}
