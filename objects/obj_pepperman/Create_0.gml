scr_initenemy();
scr_pepperman_init_sounds();
shrinkstate = 0;
throwknight = true;
knightdir = 1;
skipintro = false;
pizzaheadshot = false;
bowlingballcount = 0;
GIANTbowlingballcount = 0;
MAX_bowlingballcount = 2;
MAX_GIANTbowlingballcount = 3;
pizzahead = false;
landbuffer2 = 0;
supergrabstate = 0;
savedthrown = false;
sprite_index = spr_pepperman_intro1;
spotlightID = instance_create(x, y, obj_bossspotlight);
spotlightID.objectID = id;
parryable = false;
shakestun = false;
introbuffer = 80;
important = true;
stompable = false;
elite = true;
elitehurt = false;
turned = false;
elitehit = 10;
wastedhits = 0;
playerhit = 0;
state = 144;
hitboxID = -4;
oldtargetspot = -4;
targetspot = -4;
marbleblockmax = 1;
attackspeed = 0;
hitboxID = -4;
marbleblockID = -4;
destroyable = false;
ministate = 0;
minibuffer = 0;
idle_max = 240;
idle_timer = idle_max;
grav = 0.5;
hsp = 0;
vsp = 0;
stunned = 0;
alarm[0] = 150;
roaming = true;
collectdrop = 5;
flying = false;
straightthrow = false;
cigar = false;
cigarcreate = false;
stomped = false;
shot = false;
reset = false;
flash = false;
landspr = spr_pepperman_hurtplayer;
idlespr = spr_pepperman_hurtplayer;
fallspr = spr_pepperman_hurtplayer;
stunfallspr = spr_pepperman_hurtplayer;
walkspr = spr_pepperman_idle;
turnspr = spr_pepperman_hurtplayer;
recoveryspr = spr_pepperman_hurtplayer;
grabbedspr = spr_pepperman_hurtplayer;
scaredspr = spr_pepperman_hurtplayer;
ragespr = spr_pepperman_hurtplayer;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_pepperman_hurtplayer;
important = false;
heavy = true;
paletteselect = 0;
spr_palette = palette_cheeseslime;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
cooldown = 40;
phase = 1;
dir = 1;
woosh = false;
prevhp = 10;
flickertime = 0;
touchedground = false;
artdudes = false;
