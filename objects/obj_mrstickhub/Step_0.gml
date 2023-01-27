switch (state)
{
	case 0:
		break;
	case 8:
		if (floor(image_index) == (image_number - 1))
		{
			instance_activate_object(bossdoorID);
			with (bossdoorID)
			{
				vsp = -5;
				state = 92;
				event_perform(7, 4);
			}
			state = 92;
		}
		break;
	case 92:
		sprite_index = spr_mrstick_helicopterhat;
		y -= 10;
		if (y < -100)
			instance_destroy();
		break;
}
