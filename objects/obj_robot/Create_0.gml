scr_initenemy();
machspeed = 16;
startmachspeed = 8;
tacklespeed = 11;
grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 1;
state = 134;
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
bombreset = 0;
hp = 2;
grounded = true;
idlespr = spr_robot_idle;
stunfallspr = spr_robot_stun;
walkspr = spr_robot_walk;
stunspr = spr_robot_stun;
grabbedspr = spr_robot_stun;
image_xscale = -1;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = spr_robot_dead;
important = false;
heavy = false;
depth = 0;
turner = true;
chosenstate = 91;
elite = false;
elitehit = 2;
alarm[5] = 1;
alarm[6] = 1;
alarm[7] = 1;
tacklesnd = fmod_event_create_instance("event:/sfx/pep/suplexdash");
mach2snd = fmod_event_create_instance("event:/sfx/pep/machslideboost");
snd = true;
