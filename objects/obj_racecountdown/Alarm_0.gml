countdown--;
if countdown == 0
{
	fmod_set_parameter("race", 3, 0);
	with obj_racebarrier
		instance_destroy();
}
if countdown == -1
	instance_destroy();
alarm[0] = 60;
