var state = other.state;
var hsp = other.hsp;
if (((state == states.mach2 && hsp != 0) || (state == 244 && other.image_index > 3) || (state == states.freefall && !other.grounded) || state == states.machslide || state == states.pogo || state == 171 || state == states.bounce) && !collisioned)
	event_user(0);
