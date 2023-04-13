event_inherited();
spr_dead = spr_ratblock6_dead;
depth = 2;
anim = false;
animy = 0;

if check_midway()
{
	sprite_index = spr_ratblock6_bo;
	spr_dead = spr_ratblock6_dead_bo;
}
