var state = other.state;
var attackspeed = other.attackspeed;
if ((state == 108 && sprite_index != spr_fakepeppino_bodyslamland) || (state == 104 && attackspeed >= 50) || state == 97 || (state == 74 && sprite_index == spr_fakepeppino_flailing))
{
	if (!collisioned)
		event_user(0);
}
