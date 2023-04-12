if !active exit;

var smallimagetext = "", largeimagetext = "";
var state = "", details = "", largeimage = "", smallimage = "";

largeimage = "runner_icon";

// player character
if instance_exists(obj_player1)
	character = obj_player1.character;
smallimage = "char_" + string_lower(character);

switch character
{
	case "P": smallimagetext = "Playing as Peppino"; break;
	case "n": smallimagetext = "Playing as The Noise"; break;
	case "V": smallimagetext = "Playing as Vigilante"; break;
	case "S": smallimagetext = "Playing as Snick"; break;
}

// status
state = "Playing Solo";
if safe_get(obj_pause, "pause")
	state = "Paused";
else if safe_get(global, "panic")
{
	var minutes = 0;
	for (var seconds = ceil(global.fill / 12); seconds > 59; seconds -= 60)
		minutes++;
	if seconds < 10
		seconds = concat("0", seconds);
	
	state = string("Escaping - {0}:{1} left", minutes, seconds);
}

// level
switch safe_get(global, "leveltosave")
{
	case "entrance": details = "John Gutter"; break;
	case "medieval": details = "Pizzascape"; break;
	case "ruin": details = "Ancient Cheese"; break;
	case "dungeon": details = "Bloodsauce Dungeon"; break;
	case "badland": details = "Oregano Desert"; break;
	case "graveyard": details = "Wasteyard"; break;
	case "farm": details = "Fun Farm"; break;
	case "saloon": details = "Fast Food Saloon"; break;
	case "plage": details = "Crust Cove"; break;
	case "forest": details = "Gnome Forest"; break;
	case "space": details = "Deep-Dish 9"; break;
	case "minigolf": details = "GOLF"; break;
	case "street": details = "The Pig City"; break;
	case "sewer": details = "Oh Shit!"; break;
	case "industrial": details = "Peppibot Factory"; break;
	case "freezer": details = "Refrigerator-Refrigerador-Freezerator"; break;
	case "chateau": details = "Pizzascare"; break;
	case "kidsparty": details = "Don't Make A Sound"; break;
	case "war": details = "WAR"; break;
	case "exit": 
		if !global.panic
		{
			details = "The Crumbling Tower of Pizza";
			state = "";
		}
		break;
	
	case "desert": details = "Old Desert"; break;
	case "beach": details = "Pineapple Beach"; break;
	case "factory": details = "April Factory"; break;
	case "city": details = "Old City"; break;
	case "oldsewer": details = "Old Shit!"; break;
	case "oldfactory": details = "Old Factory"; break;
	case "oldfreezer": details = "Old Freezer"; break;
	case "golf": details = "Old GOLF"; break;
	case "pinball": details = "Space Pinball"; break;
	case "top": details = "Top"; break;
	case "oldexit": details = "Exit"; break;
	case "strongcold": details = "Strongcold"; break;
	case "dragonlair": details = "Dragon's Lair"; break;
	case "snickchallenge": details = "Snick Challenge"; break;
	
	case "canada": details = "Winter Canada"; break;
	case "midway": details = "Midway"; break;
	case "sky": details = "Sky"; break;
	case "sanctum": details = "La Burrata Temple"; break;
	case "snickrematch": details = "Snick's Rematch"; break;
	case "ancient": details = "Ancient Tower"; break;
	case "etb": details = "Early Test Build"; break;
	
	case "entranceB": details = "John Gutter B-Sides"; break;
	case "medievalB": details = "Pizzascape B-Sides"; break;
	case "ruinB": details = "Ancient Cheese B-Sides"; break;
	case "dungeonB": details = "Bloodsauce Dungeon B-Sides"; break;
}

// not a level
if details == ""
{
	state = "";
	var r = room_get_name(room);
	
	// tower floors
	if string_starts_with(r, "tower_")
	{
		var f = string_digits(r);
		
		details = "The Pizza Tower";
		if room == tower_entrancehall
			state = "Entrance";
		if room == tower_johngutterhall
			state = "John Gutter Hall";
		if f == "1"
			state = "Lobby";
		if f == "2"
			state = "Western District";
		if f == "3"
			state = "Vacation Resort";
		if f == "4"
			state = "Slum";
		if f == "5"
			state = "Staff Only";
		if room == tower_laundryroom
			state = "Wash 'n' Clean";
		if room == tower_mansion
			state = "Mansion";
		if room == tower_noisettecafe
			state = "Noisette's Café";
		if room == tower_pizzafacehall
			state = "Unknown";
		if room == tower_pizzaland
			state = "Pizzaland";
		if room == tower_graffiti
			state = "Mr. Car";
		if room == tower_ravine
			state = "Ravine";
		if room == tower_ruinsecret
			state = "Old Tower";
		if room == tower_finalhallway
			state = "Control Room";
		if room == tower_soundtest
			state = "Sound Test";
		if room == tower_outside
			state = "Outside";
		if string_pos("tutorial", r) > 0
			state = "Tutorial";
		
		// cheesed up
		if room == tower_extra
			state = "Scrapped Tower";
		if room == tower_extra2
			state = "Other Levels";
		if room == tower_hubroomE
			state = "Abandoned Tower";
	}
	
	// cutscenes
	if room == Loadiingroom
		state = "Loading...";
	if room == Mainmenu
		state = "Main Menu";
	if room == timesuproom
		state = "Time's Up!";
	if room == rank_room
		state = "Ranking";
	if room == Longintro
		state = "Are you ready?";
	if room == Finalintro
		state = "Cliff Cutscene";
	if room == Endingroom
		state = "Ending";
	if room == Creditsroom
		state = "Credits";
	if room == Johnresurrectionroom
		state = "Ending";
	
	// bosses
	if room == boss_pepperman
		state = "Pepperman";
	if room == boss_vigilante
		state = "Vigilante";
	if room == boss_noise
		state = "The Noise";
	if room == boss_fakepep or room == boss_fakepepkey or room == boss_fakepephallway
		state = "Fake Peppino";
	if room == boss_pizzaface or room == boss_pizzafacefinale
		state = "Pizzaface";
	if room == boss_pizzafacehub
		state = "Top of The Pizza Tower"
}

np_setpresence(state, details, largeimage, smallimage);
np_setpresence_more(smallimagetext, largeimagetext, false);
