if (obj_player1.spotlight == 1)
	playerid = 530;
else
	playerid = 529;
spawn = true;
if (instance_number(obj_baddie) < 20)
{
	var spawnx = playerid.x;
	var spawny = playerid.y - 200;
	var randompositionx = random_range(-500, 500);
	var spawnxrandom = spawnx + randompositionx;
	objects[0] = 517;
	objects[1] = 516;
	objects[2] = 538;
	for (i = 0; i < 3; i += 1)
	{
		while (position_meeting(spawnxrandom + 50, spawny - 50, objects[i]) || position_meeting(spawnxrandom - 50, spawny - 50, objects[i]))
		{
			spawny += 1;
			if (spawnxrandom > playerid.x)
				spawnxrandom -= 1;
			if (spawnxrandom <= playerid.x)
				spawnxrandom += 1;
		}
		while (position_meeting(spawnxrandom + 50, spawny + 50, objects[i]) || position_meeting(spawnxrandom - 50, spawny + 50, objects[i]))
		{
			spawny -= 1;
			if (spawnxrandom > playerid.x)
				spawnxrandom -= 1;
			if (spawnxrandom <= playerid.x)
				spawnxrandom += 1;
		}
	}
	with (instance_create(clamp(spawnxrandom, 200, room_width - 200), spawny, choose(668, 646, 681, 670, 688, 659, obj_ancho)))
	{
		instance_create(x, y, obj_pizzaportalfade);
		important = true;
		state = 138;
		stunned = 50;
	}
}
alarm[2] = 150;
