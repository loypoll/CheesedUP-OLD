if (global.panic == false && (!place_meeting(xstart, ystart, obj_player1) || obj_player1.state == states.chainsaw))
{
	x = xstart;
	y = ystart;
	sprite_index = spr_minipillarwoke;
	mask_index = spr_minipillarwoke;
}
else
{
	x = -100;
	y = -100;
	sprite_index = spr_minipillarsleep;
}
