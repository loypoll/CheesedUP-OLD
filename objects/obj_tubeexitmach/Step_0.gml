if (state == 150)
{
	if (floor(image_index) >= 6)
	{
		with (playerid)
		{
			visible = true;
			if (sprite_index != spr_dashpadmach)
			{
				sprite_index = spr_dashpadmach;
				vsp = 0;
				image_index = 0;
				instance_create(x, y, obj_jumpdust);
			}
			xscale = other.image_xscale;
			if (place_meeting(x, y, other.id))
			{
				while (place_meeting(x, y, other.id))
					x += sign(other.image_xscale);
			}
			machhitAnim = false;
			state = 121;
			if (movespeed < 14)
				movespeed = 14;
			var p = (object_index == obj_player1) ? 0 : 1;
			GamepadSetVibration(p, 1, 1, 0.9);
		}
	}
	with (playerid)
	{
		if (!place_meeting(x, y, other.id))
		{
			repeat (6)
				create_debris(x, y, 1591, false);
			with (other)
			{
				playerid = -1;
				state = 0;
			}
		}
	}
}
