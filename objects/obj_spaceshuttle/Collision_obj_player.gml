with (other)
{
	if (other.state == states.normal && state != states.spaceshuttle && key_up && grounded && ((state == states.ratmount && brick) or state == states.normal or state == states.mach1 or state == states.mach3 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep))
	{
		instance_create(x, y, obj_genericpoofeffect);
		other.state = states.hit;
		other.hitLag = 80;
		other.hitX = other.x;
		other.hitY = other.y;
		instance_destroy(other.arrowID);
		fmod_event_instance_play(global.snd_spaceship);
		with (obj_player)
		{
			if (check_player_coop())
			{
				hsp = 0;
				movespeed = 0;
				vsp = 0;
				state = states.spaceshuttle;
				visible = false;
				sprite_index = spr_idle;
			}
		}
	}
}
