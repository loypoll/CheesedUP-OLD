switch (state)
{
	case states.idle:
		scr_bee_idle();
		break;
	case 141:
		scr_bee_chase();
		break;
	case 257:
		scr_bee_bee();
		break;
	case 107:
		scr_bee_hurt();
		break;
}
