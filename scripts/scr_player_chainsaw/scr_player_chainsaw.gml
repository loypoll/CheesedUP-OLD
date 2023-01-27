function scr_player_chainsaw()
{
	hsp = 0;
	vsp = 0;
	x = hitX + random_range(-4, 4);
	y = hitY + random_range(-4, 4);
	hitLag--;
	if (key_slap2)
		input_buffer_slap = 0;
	image_speed = 0;
	if (key_slap2)
		input_attack_buffer = 8;
	if (hitLag <= 0)
	{
		x = hitX;
		y = hitY;
		movespeed = tauntstoredmovespeed;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
		vsp = tauntstoredvsp;
		if (global.attackstyle == 0)
		{
			if ((tauntstoredstate == 42 && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland)
			{
				jumpAnim = true;
				state = 92;
				sprite_index = spr_suplexland;
				vsp = -11;
				jumpstop = false;
				image_index = 0;
			}
			else if (tauntstoredstate == 42 || tauntstoredstate == 6)
				state = 0;
		}
		if (global.attackstyle == 1)
		{
			if ((tauntstoredstate == 42 && (tauntstoredsprite == spr_player_suplexgrabjumpstart || tauntstoredsprite == spr_player_suplexgrabjump || tauntstoredsprite == spr_player_airattack || tauntstoredsprite == spr_player_airattackstart)) || sprite_index == spr_piledriverland)
			{
				movespeed = 4;
				state = 91;
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
				image_index = 0;
				vsp = -5;
			}
			else if (tauntstoredstate == 42 || tauntstoredstate == 6)
			{
				movespeed = 4;
				state = 91;
				sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
				image_index = 0;
			}
		}
		if (global.attackstyle == 2)
		{
			if (tauntstoredstate == 43)
				state = 43;
		}
	}
}
