/// @description skins
if live_call() return live_result;

var character = characters[sel.char][0];
switch character
{
	#region Peppino
	
	case "P":
		palettes = [];
		unlockables = ["unfunny", "money", "sage", "blood", "tv", "dark", "shitty", "golden", "garish", "mooney", "funny", "itchy", "pizza", "stripes", "goldemanne", "bones", "pp", "war", "john"];
		
		add_palette(0, "yellow", noone, "Yellow", "Legends say he was pissed on...");
		add_palette(1, "classic", noone, "Peppino", "A somewhat overweight Italian chef.");
		add_palette(3, "unfunny", noone, "Unfunny", "Just like me, fr!");
		add_palette(4, "money", noone, "Money Green", "I love money too.");
		add_palette(5, "sage", noone, "Sage Blue", "The PTSD was great.");
		add_palette(6, "blood", noone, "Blood Red", "Is it that famous plumber on TV?");
		add_palette(7, "tv", noone, "TV Purple", "Go ahead. Get this legitimately.");
		add_palette(8, "dark", noone, "Dark", "It's not just a phase, MOM.");
		add_palette(9, "shitty", noone, "Shitty", "Weird, mine's usually red.");
		add_palette(10, "golden", noone, "Golden God", "No Italian is worth this much.");
		add_palette(11, "garish", noone, "Garish", "Feeling a little Sugary?");
		add_palette(15, "mooney", noone, "Mooney Orange", "He bought cigarettes with that money.");
		add_palette(12, "funny", spr_peppattern1, "Funny Polka", "When you spam Big Chungus in general.");
		add_palette(12, "itchy", spr_peppattern2, "Itchy Sweater", "Woven with Grandpa's intestines.");
		add_palette(12, "pizza", spr_peppattern3, "Pizza Man", "You DID pirate it, right?");
		add_palette(12, "stripes", spr_peppattern4, "Bowling Stripes", "Freefire o si");
		add_palette(12, "goldemanne", spr_peppattern5, "Goldemanne", "Take my upvote and leave.");
		add_palette(12, "bones", spr_peppattern6, "Bad Bones", "(Guitar riff)");
		add_palette(12, "pp", spr_peppattern7, "PP Shirt", "Get it? It's funny because");
		add_palette(12, "war", spr_peppattern8, "War Camo", "drafted");
		add_palette(12, "john", spr_peppattern9, "John Suit", "Finally, you can wear merch of dead people.");
		break;
	
	#endregion
	#region Noise
	
	case "N":
		palettes = [];
		
		add_palette(0, "N-classic", noone, "The Noise", "The mischievous gremlin.");
		break;
	#endregion
}
pal_swap_index_palette(characters[sel.char][2]);
init = true;

// automatically select current palette
sel.pal = (character == "P" ? 1 : 0);
if instance_exists(obj_player1)
{
	for(var i = 0; i < array_length(palettes); i++)
	{
		if global.palettetexture != noone
		{
			if global.palettetexture == palettes[i].texture
				sel.pal = i;
		}
		else if obj_player1.paletteselect == palettes[i].palette
			sel.pal = i;
	}
}
