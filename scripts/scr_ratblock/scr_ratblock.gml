function scr_ratblock_destroy()
{
	if (place_meeting(x, y, obj_canonexplosion))
	{
		with (instance_place(x, y, obj_canonexplosion))
		{
			instance_destroy(other);
			if (baddie)
				notification_push(34, [room]);
		}
	}
	with (obj_player)
	{
		if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other)))
			instance_destroy(other);
		if (state != 11 && state != 52 && (!scr_transformationcheck() || state == 113) && (place_meeting(x + 1, y, other) || place_meeting(x - 1, y, other) || place_meeting(x, y + 1, other) || place_meeting(x, y - 1, other)))
		{
			switch (state)
			{
				case 113:
					if (!place_meeting(x, y - 12, other))
						instance_destroy(other);
					break;
				case 34:
					vsp = -6;
					instance_destroy(other);
					break;
				case 51:
					if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
					{
						instance_create(x, y, obj_bombexplosion);
						instance_destroy(other);
						GamepadSetVibration(0, 1, 1, 0.9);
						hurted = true;
						vsp = -4;
						image_index = 0;
						sprite_index = spr_bombpepend;
						state = 51;
						bombpeptimer = 0;
					}
					break;
				case 186:
				case 150:
				case 146:
				case 33:
				case 11:
				case 14:
				case 12:
				case 35:
				case 47:
				case 49:
					break;
				case 5:
					if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
						instance_destroy(other);
					break;
				default:
					if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
						instance_destroy(other);
			}
		}
	}
}
