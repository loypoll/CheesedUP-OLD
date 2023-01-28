image_xscale = playerid.xscale;
if (playerid.state != 184 && playerid.gusdashpadbuffer <= 0 && playerid.state != 121 && playerid.ratmount_movespeed < 12 && playerid.state != 102 && playerid.state != 153)
	instance_destroy();
x = playerid.x + (((playerid.sprite_index == spr_player_Sjumpcancel) ? 20 : 0) * playerid.xscale);
y = playerid.y - (playerid.character == "M" ? 10 : 0);
if (playerid.state == 184)
	x = playerid.x + (playerid.xscale * 18);
if (playerid.state == 191)
	x = playerid.x + (playerid.xscale * 18);
visible = !(room == rank_room);
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	visible = false;
