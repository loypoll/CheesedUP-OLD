if (other.vsp > 0 && instance_exists(baddieID) && baddieID.destroyable)
{
	if (baddieID.destroyable)
		instance_destroy(baddieID);
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += (5 + floor(global.combo / 5));
		global.combotime = 60;
		global.heattime = 60;
	}
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
}
