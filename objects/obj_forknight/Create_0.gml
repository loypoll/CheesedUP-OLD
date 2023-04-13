scr_initenemy();
is_controllable = true;
grav = 0.5;
hsp = 0;
vsp = 0;
state = states.walk;
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
hp = 1;
hitboxcreate = false;
grounded = true;
idlespr = spr_forknight_idle;
stunfallspr = spr_forknight_stun;
walkspr = spr_forknight_walk;
grabbedspr = spr_forknight_grabbed;
scaredspr = spr_forknight_scared;
sprite_index = spr_forknight_walk;
flash = false;
slapped = false;
birdcreated = false;
boundbox = false;
spr_dead = spr_forknight_dead;
important = false;
heavy = false;
depth = 0;
paletteselect = 0;
spr_palette = palette_forknight;
grabbedby = 0;
stuntouchbuffer = 0;
ragedash = 0;
ragecooldown = 0;

if check_midway()
{
	walkspr = spr_pinhead_walk;
	grabbedspr = spr_pinhead_stun;
	stunfallspr = spr_pinhead_stun;
	scaredspr = spr_pinhead_scared;
	spr_dead = spr_pinhead_dead;
	sprite_index = walkspr;
}
