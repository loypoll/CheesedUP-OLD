switch (state)
{
	case states.fall:
		add_y += 8;
		if (add_y >= 0)
		{
			state = 8;
			y += 20;
		}
		break;
	case 8:
		y = Approach(y, SCREEN_HEIGHT - 100, 6);
		if (y == (SCREEN_HEIGHT - 100))
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
