if (room != kidsparty_entrance1)
{
	var roomname = room_get_name(room);
	roomname = string_letters(roomname);
	if (room == tower_pizzafacehall or room == tower_5 or room == boss_fakepephallway or roomname == "kidspartyfloor" or roomname == "kidspartyentrance" or roomname == "kidspartybasementsecret" or roomname == "kidspartysecret" or roomname == "streetbacon")
	{
		kidsparty_lightning = true;
		dark_lightning = false;
	}
	else
	{
		kidsparty_lightning = false;
		dark_lightning = false;
	}
}
else
{
	kidsparty_lightning = false;
	dark_lightning = false;
}
if (room == dungeon_5 or room == dungeon_6)
or (room == strongcold_10 or room == strongcold_9)
{
	use_dark = true;
	dark_alpha = 1;
}
else
	use_dark = false;
if (room == Mainmenu or room == Longintro)
{
	use_dark = false;
	kidsparty_lightning = false;
	dark_lightning = false;
}
