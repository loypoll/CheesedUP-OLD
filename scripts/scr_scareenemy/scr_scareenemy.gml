function scr_scareenemy()
{
	var player = instance_nearest(x, y, obj_player);
	if (state != 4 && state != 138 && state != 137 && state != 266)
	{
		if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 90) && y >= (player.y - 130)) && ((player.xscale > 0 && x >= player.x) || (player.xscale < 0 && x <= player.x)))
		{
			if (sprite_index != scaredspr && state != 126 && state != 138 && state != 155 && (player.state == 41 || player.ratmount_movespeed == 12 || player.state == 121 || player.state == 31 || player.state == 184 || player.state == 20 || player.state == 38 || (player.state == 79 && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
			{
				if (collision_line(x, y, player.x, player.y, obj_solid, false, true) == -4)
				{
					state = 126;
					sprite_index = scaredspr;
					if (x != player.x)
						image_xscale = -sign(x - player.x);
					scaredbuffer = 100;
					if (irandom(100) <= 5)
						fmod_event_one_shot_3d("event:/sfx/voice/enemyrarescream", x, y);
					if (vsp < 0)
						vsp = 0;
					if (grounded)
						vsp = -3;
				}
			}
		}
	}
}
