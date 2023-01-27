secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
music_map = ds_map_create();
music = -4;
savedpillarpause = false;
savedpanicpause = false;
savedmusicpause = false;
savedsecretpause = false;
savedpanicpos = 0;
exitmusic = false;
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic");
panicmusicID = fmod_event_create_instance("event:/music/pizzatime");
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase");
panicstart = false;
add_music(799, "event:/music/ending", -4, false);
add_music(820, "event:/music/credits", -4, false);
add_music(821, "event:/music/ending", -4, false);
add_music(822, "event:/music/intro", -4, false, function()
{
	fmod_event_instance_set_parameter(argument1, "state", 0, true);
});
add_music(776, "event:/music/title", -4, false, function()
{
	fmod_event_instance_set_parameter(argument1, "state", 0, true);
});
add_music(788, "event:/music/tutorial", "event:/music/pillarmusic", false);
add_music(757, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(803, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(756, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(752, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(748, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(744, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(740, "event:/music/hub", "event:/music/pillarmusic", false, hub_state);
add_music(739, "event:/music/finalescape", -4, false);
add_music(819, "event:/music/pillarmusic", -4, false);
add_music(782, "event:/music/w5/finalhallway", -4, false);
add_music(828, "event:/sfx/misc/windloop", -4, false);
add_music(777, "event:/music/pillarmusic", -4, false);
add_music(778, "event:/music/pillarmusic", -4, false);
add_music(780, "event:/music/pillarmusic", -4, false);
add_music(781, "event:/music/pillarmusic", -4, false);
add_music(514, "event:/music/boss/vigilante", -4, false);
add_music(783, "event:/music/boss/fakepep", -4, false);
add_music(784, "event:/music/boss/fakepepambient", -4, false);
add_music(785, "event:/music/pillarmusic", -4, false);
add_music(515, "event:/music/boss/noise", -4, false);
add_music(513, "event:/music/boss/pepperman", -4, false);
add_music(659, "event:/music/boss/pizzaface", -4, false, function()
{
	if (argument0 == 659)
		fmod_event_instance_set_parameter(argument1, "state", 0, true);
	else if (argument0 == 787)
		fmod_event_instance_set_parameter(argument1, "state", 5, false);
});
add_music(24, "event:/music/w1/entrance", "event:/music/w1/entrancesecret", false, function()
{
	var s = 0;
	fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(39, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 39:
		case 40:
			s = 0;
			break;
		case 41:
		case 44:
			s = 0;
			break;
		case 46:
			s = 2;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(54, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 54:
		case 59:
			s = 0;
			break;
		case 60:
			s = 1;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(71, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", false);
add_music(719, "event:/music/w2/desert", "event:/music/w2/desertsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 719:
		case 800:
		case 731:
			s = 0;
			break;
		case 729:
		case 734:
			s = 1;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(138, "event:/music/w2/farm", "event:/music/w2/farmsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 138:
		case 145:
			s = 0;
			break;
		case 149:
			s = 1;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(123, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", false);
add_music(687, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", false);
add_music(706, "event:/music/w3/beach", "event:/music/w3/beachsecret", false);
add_music(194, "event:/music/w3/forest", "event:/music/w3/forestsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 194:
		case 196:
			s = 0;
			break;
		case 772:
			s = 1;
			break;
		case 554:
			if (obj_player1.isgustavo)
				s = 2;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(229, "event:/music/w3/golf", "event:/music/w3/golfsecret", false);
add_music(241, "event:/music/w3/space", "event:/music/w3/spacesecret", false);
add_music(441, "event:/music/w4/freezer", "event:/music/w4/freezersecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 441:
		case 454:
			s = 0;
			break;
		case 457:
			s = 1;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(672, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", false, function()
{
	var s = -1;
	switch (argument0)
	{
		case 672:
		case 673:
			s = 0;
			break;
		case 674:
			s = 1;
			break;
	}
	if (s != -1)
		fmod_event_instance_set_parameter(argument1, "state", s, true);
});
add_music(830, "event:/music/w4/sewer", "event:/music/w4/sewersecret", false);
add_music(560, "event:/music/w4/street", "event:/music/w4/streetsecret", false, function()
{
	if (argument0 == 560 || argument0 == 565)
		fmod_event_instance_set_parameter(argument1, "state", 0, true);
	else if (argument0 == 773)
		fmod_event_instance_set_parameter(argument1, "state", 2, true);
	if (argument0 == 566)
		fmod_set_parameter("musicmuffle", 1, false);
	else
		fmod_set_parameter("musicmuffle", 0, false);
});
add_music(244, "event:/music/w5/chateau", "event:/music/w1/medievalsecret", false);
add_music(596, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", false);
add_music(526, "event:/music/w5/war", "event:/music/w5/warsecret", false);
