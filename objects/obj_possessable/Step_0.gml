if (state == 17)
{
	with (playerid)
	{
		sprite_index = spr_ghostidle;
		x = other.x;
		y = other.y;
		if (key_up2 && other.object_index != obj_randomobject)
		{
			state = 16;
			vsp = -10;
			create_particle(x, y, particle.genericpoofeffect, 0);
			visible = true;
			other.state = 0;
		}
	}
}
