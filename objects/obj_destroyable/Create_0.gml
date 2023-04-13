depth = 1;
image_index = random_range(0, image_number - 1);
particlespr = spr_towerblockdebris;

if check_midway()
{
	sprite_index = spr_towerblocksmall_bo;
	particlespr = spr_towerblockdebris_bo;
}
