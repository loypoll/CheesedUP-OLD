sprite_index = !collide ? spr_bomb : noone;
if (instance_exists(obj_bomb))
	collide = false;
if (obj_player1.state != 183)
	collide = false;
