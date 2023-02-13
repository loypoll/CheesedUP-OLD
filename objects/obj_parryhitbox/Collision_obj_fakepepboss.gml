var state = other.state;
var attackspeed = other.attackspeed;
if (state == 108 || (state == states.mach2 && attackspeed >= 18) || state == 97 || (state == 74 && attackspeed > 4))
{
	if (!collisioned)
		event_user(0);
}
