if (other.cutscene == 0 && other.state != 146 && state != 146 && other.state != 186 && state != 186)
{
	if (hurted == 0 && other.hurted == 0 && fightballadvantage == 1 && (state == 42 || state == 80) && (other.state == 42 || other.state == 80))
	{
		if (object_index == obj_player1)
		{
			obj_player1.state = 121;
			obj_player2.state = 4;
			obj_player2.xscale = xscale;
			obj_player1.depth = -7;
			obj_player2.depth = -6;
		}
		if (object_index == obj_player2)
		{
			obj_player2.state = 121;
			obj_player1.state = 4;
			obj_player1.xscale = xscale;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
		}
		obj_player1.image_index = 0;
		obj_player2.image_index = 0;
		obj_player1.sprite_index = obj_player1.spr_fightball;
		obj_player2.sprite_index = obj_player2.spr_fightball;
		obj_player1.fightball = true;
		obj_player2.fightball = true;
	}
	with (obj_player2)
	{
		if (state == 42 && other.hurted == 0 && other.state != 107 && other.state != 38 && other.state != 47 && other.state != 5 && other.state != 9 && other.state != 51 && other.cutscene == 0 && other.hurted == 0 && hurted == 0 && !(other.state == 42 || other.state == 80))
		{
			movespeed = 0;
			image_index = 0;
			sprite_index = spr_haulingstart;
			baddiegrabbedID = other.id;
			state = 79;
			other.state = 4;
			obj_player1.depth = -6;
			obj_player2.depth = -7;
		}
		if (state == 108 && other.hurted == 0 && other.state != 59 && other.state != 107 && hurted == 0)
		{
			scr_changetoppings();
			obj_player1.depth = -6;
			obj_player2.depth = -7;
			obj_player1.state = 59;
			obj_player1.sprite_index = obj_player1.spr_squished;
			obj_player1.image_index = 0;
		}
		if (other.state == 80 && hurted == 0 && other.hurted == 0 && !(state == 42 || state == 80))
		{
			xscale = -other.xscale;
			with (other)
				scr_pummel();
			obj_player1.depth = -7;
			obj_player2.depth = -6;
			thrown = true;
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_slapstar);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			instance_create(x, y, obj_baddiegibs);
			with (obj_camera)
			{
				shake_mag = 3;
				shake_mag_acc = 3 / room_speed;
			}
			state = 107;
			x = obj_player1.x;
			y = obj_player1.y;
			alarm[8] = 60;
			alarm[7] = 120;
			movespeed = 15;
			vsp = -6;
			sprite_index = spr_hurt;
		}
	}
}
