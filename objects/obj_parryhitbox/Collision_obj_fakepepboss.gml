var state = other.state;
var attackspeed = other.attackspeed;
if (state == states.freefall or (state == states.mach2 && attackspeed >= 18) or state == states.Sjump or (state == states.throwing && attackspeed > 4))
{
	if (!collisioned)
		event_user(0);
}
