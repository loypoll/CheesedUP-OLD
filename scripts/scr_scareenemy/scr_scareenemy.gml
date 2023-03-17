function scr_scareenemy()
{
	var player = instance_nearest(x, y, obj_player);
	if (state != states.grabbed && state != states.stun && state != states.hit && state != states.secret)
	{
		if ((player.x > (x - 400) && player.x < (x + 400)) && (y <= (player.y + 90) && y >= (player.y - 130)) && ((player.xscale > 0 && x >= player.x) or (player.xscale < 0 && x <= player.x)))
		{
			if (sprite_index != scaredspr && state != states.idle && state != states.stun && state != states.staggered && (player.state == states.chainsawbump or player.ratmount_movespeed == 12 or player.state == states.mach3 or player.state == states.rideweenie or player.state == states.rocket or player.state == states.tacklecharge or player.state == states.knightpepslopes or (player.state == states.grab && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)))
			{
				if collision_line(x, y, player.x, player.y, obj_solid, false, true) == noone
				{
					state = states.idle;
					sprite_index = scaredspr;
					if (x != player.x)
						image_xscale = -sign(x - player.x);
					scaredbuffer = 100;
					if (irandom(100) <= 5)
						sound_play_3d("event:/sfx/voice/enemyrarescream", x, y);
					if (vsp < 0)
						vsp = 0;
					if (grounded)
						vsp = -3;
				}
			}
		}
	}
}
