if (state == 152)
	exit;
if (ds_queue_size(followqueue) < LAG_STEPS)
	exit;
with (obj_player)
{
	targetRoom = other.targetRoom;
	lastroom = room;
	targetDoor = other.targetDoor;
	visible = false;
	if (state != states.gotoplayer)
		state = 152;
	cutscene = true;
	hsp = 0;
	vsp = 0;
}
grav = 0;
state = 152;
hsp = 10;
image_xscale = 1;
vsp = 0;
