x = obj_player1.x;
y = obj_player1.y;
if (!instance_exists(obj_pizzaface_thunderdark) && global.stylethreshold < 2)
{
	visible = false;
	is_visible = false;
}
else
{
	visible = obj_player1.visible;
	is_visible = true;
}
if (room == rank_room)
	visible = false;
if (instance_exists(obj_pizzaface_thunderdark))
	alpha = 0.2;
if (global.stylethreshold == 2)
	alpha = 0.2;
if (global.stylethreshold == 3)
	alpha = 0.4;
Vspeed = random_range(-1, 1);
Hspeed = random_range(-1, 1);
alarm[0] = 10;
