targetplayer = global.coop ? instance_nearest(x, y, obj_player) : obj_player1;
switch (state)
{
	case 0:
		state_turret_normal();
		break;
	case 128:
		state_turret_charge();
		break;
}
if (invtime > 0)
	invtime--;
if (hp <= 0)
	instance_destroy();
