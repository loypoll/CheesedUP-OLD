alarm[0] = 60;
sticked = true;
create_debris(x + random_range(-5, 5), y + random_range(-5, 5), 1517, false);
x = other.x;
y = other.y;
with (other)
{
	cheesepeptimer = 2;
	sprite_index = spr_cheesepepfall;
	image_index = 0;
	state = 26;
}
instance_destroy();
