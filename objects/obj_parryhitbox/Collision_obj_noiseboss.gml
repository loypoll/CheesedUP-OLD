var state = other.state;
var hsp = other.hsp;
if (((state == 104 && hsp != 0) || (state == 244 && other.image_index > 3) || (state == 108 && !other.grounded) || state == 105 || state == 58 || state == 171 || state == 127) && !collisioned)
	event_user(0);
