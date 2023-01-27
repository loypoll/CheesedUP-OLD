switch (state)
{
	case 135:
		add_y += 8;
		if (add_y >= 0)
		{
			state = 8;
			y += 20;
		}
		break;
	case 8:
		y = Approach(y, obj_screensizer.actual_height - 100, 6);
		if (y == (obj_screensizer.actual_height - 100))
		{
			state = 293;
			buffer = 1;
		}
		break;
	case 293:
		if (global.pigtotal_add > 0)
			global.pigtotal_add--;
		else
			state = 0;
		break;
}
