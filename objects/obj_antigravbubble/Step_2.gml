x = playerid.x;
y = playerid.y;
mask_index = playerid.mask_index;
xs = Approach(xs, 1, 0.12);
image_xscale = xs;
image_yscale = xs;
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	visible = false;
else
	visible = playerid.visible;
if (sprite_index == spr_antigrav_bubblesquish && floor(image_index) == (image_number - 1))
	sprite_index = spr_antigrav_bubble;
if (playerid.state != 265 && playerid.state != 61 && (playerid.state != 297 || (playerid.tauntstoredstate != 265 && !visible)))
	instance_destroy();
