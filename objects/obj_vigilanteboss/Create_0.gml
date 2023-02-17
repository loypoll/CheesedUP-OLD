scr_initenemy();
important = true;
scr_vigilante_init_sounds();
attack_list = -4;
currentattack = 0;
skipintro = false;

enum vigi_attack
{
	revolver,
	dynamite,
	cow,
	estampede,
	flamethrower,
	machinegun,
	bazooka,
	crate,
	mach,
	wait,
	reload
}

vigilante_start_attack(0, 0);
vigilante_add_attack(0, 0, vigi_attack.revolver, 25);
vigilante_add_attack(0, 0, vigi_attack.revolver, 25);
vigilante_add_attack(0, 0, vigi_attack.wait, 25);
vigilante_add_attack(0, 0, vigi_attack.mach, 45);
vigilante_add_attack(0, 0, vigi_attack.revolver, 25);
vigilante_add_attack(0, 0, vigi_attack.revolver, 15);
vigilante_add_attack(0, 0, vigi_attack.mach, 45);
vigilante_end_attack(0, 0);

vigilante_start_attack(0, 1);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.wait, 25);
vigilante_add_attack(0, 1, vigi_attack.revolver, 10);
vigilante_add_attack(0, 1, vigi_attack.wait, 35);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.revolver, 10);
vigilante_add_attack(0, 1, vigi_attack.revolver, 10);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.wait, 15);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.dynamite);
vigilante_add_attack(0, 1, vigi_attack.mach, 5);
vigilante_add_attack(0, 1, vigi_attack.wait, 85);
vigilante_add_attack(0, 1, vigi_attack.revolver, 10);
vigilante_end_attack(0, 1);

vigilante_start_attack(0, 2);
vigilante_add_attack(0, 2, vigi_attack.machinegun);
vigilante_add_attack(0, 2, vigi_attack.dynamite);
vigilante_add_attack(0, 2, vigi_attack.dynamite);
vigilante_end_attack(0, 2);

vigilante_start_attack(0, 3);
vigilante_add_attack(0, 3, vigi_attack.machinegun);
vigilante_add_attack(0, 3, vigi_attack.revolver, 10);
vigilante_add_attack(0, 3, vigi_attack.revolver, 10);
vigilante_add_attack(0, 3, vigi_attack.revolver, 10);
vigilante_add_attack(0, 3, vigi_attack.revolver, 10);
vigilante_end_attack(0, 3);

vigilante_start_attack(0, 4);
vigilante_add_attack(0, 4, vigi_attack.mach, 45);
vigilante_add_attack(0, 4, vigi_attack.wait, 5);
vigilante_end_attack(0, 4);

vigilante_start_attack(0, 5);
vigilante_add_attack(0, 5, vigi_attack.bazooka);
vigilante_add_attack(0, 5, vigi_attack.mach, 20);
vigilante_add_attack(0, 5, vigi_attack.bazooka);
vigilante_add_attack(0, 5, vigi_attack.mach, 5);
vigilante_add_attack(0, 5, vigi_attack.bazooka);
vigilante_add_attack(0, 5, vigi_attack.mach, 25);
vigilante_add_attack(0, 5, vigi_attack.wait, 25);
vigilante_add_attack(0, 5, vigi_attack.dynamite);
vigilante_add_attack(0, 5, vigi_attack.dynamite);
vigilante_add_attack(0, 5, vigi_attack.dynamite);
vigilante_add_attack(0, 5, vigi_attack.revolver, 5);
vigilante_add_attack(0, 5, vigi_attack.revolver, 5);
vigilante_end_attack(0, 5);

vigilante_start_attack(0, 6);
vigilante_add_attack(0, 6, vigi_attack.dynamite);
vigilante_add_attack(0, 6, vigi_attack.dynamite);
vigilante_add_attack(0, 6, vigi_attack.flamethrower, 200);
vigilante_end_attack(0, 6);

vigilante_start_attack(0, 7);
vigilante_add_attack(0, 7, vigi_attack.flamethrower, 200);
vigilante_add_attack(0, 7, vigi_attack.wait, 45);
vigilante_end_attack(0, 7);

vigilante_start_attack(0, 8);
vigilante_add_attack(0, 8, vigi_attack.crate);
vigilante_add_attack(0, 8, vigi_attack.wait, 300);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.wait, 100);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.revolver, 5);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_add_attack(0, 8, vigi_attack.dynamite);
vigilante_end_attack(0, 8);

vigilante_start_attack(1, 0);
vigilante_add_attack(1, 0, vigi_attack.dynamite);
vigilante_end_attack(1, 0);

vigilante_start_attack(1, 1);
vigilante_add_attack(1, 1, vigi_attack.mach, 25);
vigilante_end_attack(1, 1);

vigilante_start_attack(1, 2);
vigilante_add_attack(1, 2, vigi_attack.revolver, 25);
vigilante_end_attack(1, 2);

vigilante_start_attack(1, 3);
vigilante_add_attack(1, 3, vigi_attack.dynamite);
vigilante_add_attack(1, 3, vigi_attack.dynamite);
vigilante_add_attack(1, 3, vigi_attack.dynamite);
vigilante_add_attack(1, 3, vigi_attack.dynamite);
vigilante_add_attack(1, 3, vigi_attack.dynamite);
vigilante_add_attack(1, 3, vigi_attack.bazooka);
vigilante_end_attack(1, 3);

vigilante_start_attack(1, 4);
vigilante_add_attack(1, 4, vigi_attack.crate);
vigilante_add_attack(1, 4, vigi_attack.flamethrower, 1900);
vigilante_end_attack(1, 4);

vigilante_start_attack(1, 5);
vigilante_add_attack(1, 5, vigi_attack.crate);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_add_attack(1, 5, vigi_attack.machinegun);
vigilante_end_attack(1, 5);

vigilante_start_attack(1, 6);
vigilante_add_attack(1, 6, vigi_attack.crate);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_add_attack(1, 6, vigi_attack.mach, 45);
vigilante_end_attack(1, 6);

vigilante_start_attack(1, 7);
vigilante_add_attack(1, 7, vigi_attack.mach, 45);
vigilante_end_attack(1, 7);

vigilante_start_attack(1, 8);
vigilante_add_attack(1, 8, vigi_attack.revolver, 25);
vigilante_add_attack(1, 8, vigi_attack.revolver, 24);
vigilante_add_attack(1, 8, vigi_attack.revolver, 23);
vigilante_add_attack(1, 8, vigi_attack.revolver, 22);
vigilante_add_attack(1, 8, vigi_attack.revolver, 21);
vigilante_add_attack(1, 8, vigi_attack.revolver, 20);
vigilante_add_attack(1, 8, vigi_attack.revolver, 19);
vigilante_add_attack(1, 8, vigi_attack.revolver, 18);
vigilante_add_attack(1, 8, vigi_attack.revolver, 17);
vigilante_add_attack(1, 8, vigi_attack.revolver, 16);
vigilante_add_attack(1, 8, vigi_attack.revolver, 15);
vigilante_add_attack(1, 8, vigi_attack.revolver, 14);
vigilante_add_attack(1, 8, vigi_attack.revolver, 13);
vigilante_add_attack(1, 8, vigi_attack.revolver, 12);
vigilante_add_attack(1, 8, vigi_attack.revolver, 11);
vigilante_add_attack(1, 8, vigi_attack.revolver, 10);
vigilante_add_attack(1, 8, vigi_attack.revolver, 9);
vigilante_add_attack(1, 8, vigi_attack.revolver, 8);
vigilante_add_attack(1, 8, vigi_attack.revolver, 7);
vigilante_add_attack(1, 8, vigi_attack.wait, 200);
vigilante_end_attack(1, 8);

bossvulnerableID = -4;
targetguy_max = 1000;
alarm[8] = targetguy_max;
crouchalphabuffer = 0;
camzoom = 1;
signspr = spr_preparetodraw;
reposition = false;
signy = -sprite_get_height(signspr);
pizzahead = false;
pizzaheadshot = false;
sprite_index = spr_vigilante_intro1;
bullethit = 0;
oldspotID = -4;
uzi_speed = 0.35;
parryable = false;
flameID = -4;
playerhit = 0;
reloadbuffer = 0;
kick = false;
jump = false;
introwait = false;
spotID = instance_place(x, y, obj_vigilantespot);
spotlightID = instance_create(x, y, obj_bossspotlight);
spotlightID.objectID = id;
introbuffer = 80;
important = true;
stompable = false;
shakestun = false;
estampedemax = 0;
elite = true;
elitehit = 9;
prevhp = elitehit;
turned = false;
wastedhits = 0;
state = states.arenaintro;
hitboxID = -4;
oldtargetspot = -4;
targetspot = -4;
marbleblockmax = 1;
attackspeed = 0;
hitboxID = -4;
marbleblockID = -4;
destroyable = false;
ministate = states.normal;
minibuffer = 0;
revolverbuffer = 0;
ammo = 6;
shot = 6;
duelphase = 1;
duelplayer = false;
idle_max = 5;
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
landspr = spr_playerV_hurt;
idlespr = spr_playerV_hurt;
fallspr = spr_playerV_hurt;
stunfallspr = spr_playerV_stun;
walkspr = spr_playerV_idle;
turnspr = spr_playerV_hurt;
recoveryspr = spr_playerV_hurt;
grabbedspr = spr_playerV_hurt;
scaredspr = spr_playerV_hurt;
ragespr = spr_playerV_hurt;
hp = 1;
slapped = false;
grounded = true;
birdcreated = false;
boundbox = false;
spr_dead = spr_playerV_hurt;
important = false;
heavy = true;
paletteselect = 0;
spr_palette = palette_cheeseslime;
grabbedby = 0;
stuntouchbuffer = 0;
scaredbuffer = 0;
cooldown = 5;
phase = 1;
dir = 1;
woosh = false;
flickertime = 0;
touchedground = false;
cowcrate = 0;
