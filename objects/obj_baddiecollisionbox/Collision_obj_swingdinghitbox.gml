if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.state != states.grabbed && !baddieID.invincible && baddieID.instantkillable)
{
	baddieID.invtime = 25;
	sound_play_3d("event:/sfx/pep/punch", x, y);
	if (!baddieID.important)
	{
		global.style += (4 + floor(global.combo / 2));
		global.combotime = 60;
		global.heattime = 60;
	}
	var lag = 8;
	baddieID.hitLag = lag;
	baddieID.hitX = baddieID.x;
	baddieID.hitY = baddieID.y;
	baddieID.hp -= 1;
	instance_create(baddieID.x, baddieID.y, obj_parryeffect);
	baddieID.alarm[3] = 3;
	baddieID.state = states.hit;
	baddieID.image_xscale = -other.image_xscale;
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_slapstar(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	create_baddiegibs(x, y);
	with (obj_camera)
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	baddieID.hitvsp = -8;
	baddieID.hithsp = other.image_xscale * 15;
}
