if (other.state == 186)
	exit;
fmod_event_one_shot_3d("event:/sfx/misc/balloonpop", x, y);
create_particle(x, y, particle.balloonpop, 0);
other.vsp = -14;
other.jumpstop = true;
visible = false;
x = -100;
y = -100;
respawn = 100;
if (other.state == 92)
	other.sprite_index = other.spr_machfreefall;
if (other.state == 37)
{
	other.sprite_index = other.spr_machfreefall;
	other.state = 92;
}
