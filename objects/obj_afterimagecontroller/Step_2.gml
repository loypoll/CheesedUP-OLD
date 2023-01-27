for (var i = 0; i < ds_list_size(global.afterimage_list); i++)
{
	var b = ds_list_find_value(global.afterimage_list, i);
	with (b)
	{
		for (var l = 0; l < array_length(alarm); l++)
		{
			if (alarm[l] >= 0)
				alarm[l]--;
		}
		switch (identifier)
		{
			case 1:
				if (!(playerid.state == 92 && playerid.sprite_index == spr_playerN_noisebombspinjump) && playerid.pizzapepper == 0 && playerid.state != 97 && playerid.state != 191 && playerid.state != 192 && (playerid.state != 16 || playerid.ghostpepper < 2) && playerid.sprite_index != playerid.spr_mach && playerid.sprite_index != playerid.spr_mach4 && playerid.sprite_index != spr_player_barrelroll && playerid.state != 55 && playerid.state != 147 && playerid.state != 41 && playerid.state != 80 && playerid.state != 41 && playerid.state != 31 && playerid.state != 102 && playerid.state != 4 && playerid.pogochargeactive == 0 && playerid.state != 20 && playerid.state != 121 && playerid.state != 37 && playerid.state != 19 && playerid.state != 128 && playerid.state != 104 && playerid.state != 42 && playerid.state != 105 && playerid.state != 75 && playerid.state != 63 && playerid.state != 73 && playerid.state != 76 && playerid.state != 65 && playerid.state != 61 && playerid.state != 97 && playerid.state != 33 && playerid.gusdashpadbuffer <= 0)
					alarm[0] = 0;
				if (playerid.state == 104 || playerid.state == 103 || playerid.state == 121)
				{
					var p = 4;
					var m = playerid.movespeed - p;
					var t = 12 - p;
					alpha = m / t;
					alpha = clamp(alpha, 0, 1);
				}
				visible = playerid.visible;
				with (playerid)
				{
					if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
						other.visible = false;
				}
				break;
			case 2:
				x += hsp;
				y += vsp;
				break;
			case 3:
			case 4:
			case 7:
			case 6:
				alpha -= 0.05;
				if (alpha <= 0 && alarm[0] != 0)
					alarm[0] = 0;
				break;
			case 5:
				alpha -= spd;
				x += hsp;
				y += vsp;
				if (alpha <= 0 && alarm[0] != 0)
					alarm[0] = 0;
				if (playerid != -4 && instance_exists(playerid))
					visible = playerid.visible;
				else
					visible = true;
				break;
		}
		if (alarm[1] == 0)
		{
			other.alpha[identifier] = 0;
			alarm[2] = 3;
		}
		if (alarm[2] == 0)
		{
			other.alpha[identifier] = 1;
			if (identifier == 1)
				other.alpha[identifier] = alpha;
			alarm[2] = 3;
		}
		if (alarm[0] == 0)
		{
			b = undefined;
			ds_list_delete(global.afterimage_list, i);
			i--;
		}
		else
		{
		}
	}
}
