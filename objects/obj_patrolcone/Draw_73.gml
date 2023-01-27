with (baddieID)
{
	if (alarm[5] != -1 || state == 80)
	{
		var p = patroltimermax - patroltimer;
		if (state == 80)
			p++;
		var t = (p * 3) + other.patrolalert_index;
		draw_sprite(spr_patrolalert_number, t, x, y - 100);
	}
}
