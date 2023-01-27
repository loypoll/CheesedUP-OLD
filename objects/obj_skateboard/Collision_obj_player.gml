if (other.state != 61 && other.skateboarding == 0)
{
	fmod_event_one_shot_3d("event:/sfx/misc/honkhonk", x, y);
	instance_create(x, y, obj_genericpoofeffect);
	other.movespeed = 10;
	other.state = 104;
	other.skateboarding = true;
	other.clowntimer = 300;
}
