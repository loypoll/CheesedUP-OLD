if (room == rm_editor)
{
	mask_index = spr_minipillarwoke;
	exit;
}
if (global.panic == false || (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw))
{
	x = -100;
	y = -100;
	sprite_index = spr_minipillarsleep;
	mask_index = spr_minipillarsleep;
}
else
{
	mask_index = spr_minipillarwoke;
	sprite_index = spr_minipillarwoke;
	x = xstart;
	y = ystart;
}
