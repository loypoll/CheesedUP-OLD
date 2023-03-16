var state = other.state;
var attackspeed = other.attackspeed;
if ((state == states.freefall && sprite_index != spr_fakepeppino_bodyslamland) or (state == states.mach2 && attackspeed >= 50) or state == states.Sjump or (state == states.throwing && sprite_index == spr_fakepeppino_flailing))
{
	if (!collisioned)
		event_user(0);
}
