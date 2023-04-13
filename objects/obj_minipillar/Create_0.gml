image_speed = 0.35;
depth = 4;
player = 0;

sleep = spr_minipillarsleep;
woke = spr_minipillarwoke;

if check_midway()
{
	sleep = spr_minipillarsleep_bo;
	woke = spr_minipillarwoke_bo;
}
