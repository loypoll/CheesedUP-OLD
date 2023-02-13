var state = other.state;
var hsp = other.hsp;
if (((state == states.mach2 && hsp != 0) || (state == 244 && other.image_index > 3) || (state == 108 && !other.grounded) || state == states.machslide || state == states.pogo || state == 171 || state == 127) && !collisioned)
	event_user(0);
