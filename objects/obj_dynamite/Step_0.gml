hsp = image_xscale * movespeed;
mask_index = spr_player_mask;
if (scr_solid(x, y + 1) && vsp > 0)
{
	vsp = -5;
	if (movespeed > 0)
		movespeed -= 1;
}
if (obj_explosion != 141 && obj_explosion != 586 && playerid.key_shoot2 && playerid.state != 2)
{
	instance_destroy();
	instance_create(x, y, obj_explosion);
}
if (place_meeting(x + hsp, y, obj_solid) || place_meeting(x + hsp, y + vsp, obj_destructibles) || (obj_explosion != 586 && place_meeting(x, y, obj_baddie)))
	image_xscale *= -1;
if (place_meeting(x + hsp, y + vsp, obj_destructibles) || place_meeting(x + hsp, y + vsp, obj_metalblock) || (obj_explosion != 586 && place_meeting(x, y, obj_baddie)))
{
	instance_destroy();
	instance_create(x, y, obj_explosion);
}
if (countdown <= 0)
{
	instance_destroy();
	instance_create(x, y, obj_explosion);
}
if (sprite_index == spr_dynamite && alarm[0] < 60)
	sprite_index = spr_dynamiteabouttoexplode;
if (sprite_index == spr_dynamite || sprite_index == spr_dynamiteabouttoexplode)
	countdown--;
scr_collide();
