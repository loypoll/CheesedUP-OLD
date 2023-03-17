var state = other.state;
var hsp = other.hsp;
if (((state == states.mach2 && hsp != 0) or (state == states.pizzahead_spinningkick && other.image_index > 3) or (state == states.freefall && !other.grounded) or state == states.machslide or state == states.pogo or state == states.jetpack or state == states.bounce) && !collisioned)
	event_user(0);
