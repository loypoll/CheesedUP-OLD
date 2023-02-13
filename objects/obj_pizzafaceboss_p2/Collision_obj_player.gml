if (other.state == 47 && other.sprite_index != other.spr_knightpepstart && other.sprite_index != other.spr_knightpepthunder)
{
	fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y);
	state = states.stun;
	stunned = 1000;
	lastattack = 0;
	throwsword = false;
	other.state = 0;
	other.jumpstop = true;
	other.vsp = -11;
	instance_destroy(obj_swordstone);
}
