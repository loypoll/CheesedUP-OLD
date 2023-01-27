if (other.state == 47 && state == 238 && vsp > 0)
{
	hp--;
	other.state = 0;
	other.jumpstop = true;
	other.vsp = -11;
	state = 0;
}
