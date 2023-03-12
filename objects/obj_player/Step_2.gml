// race mode blocks
var traveldis = x - xprevious;
for(var i = 0; i < abs(traveldis); i++)
{
	if place_meeting(xprevious + i * sign(traveldis), y, obj_lapblockparent)
		lapindex = instance_place(xprevious + i * sign(traveldis), y, obj_lapblockparent);
}
if instance_exists(lapindex)
{
	if instance_exists(lapindex.nextobj)
		lapdis = 1 - (distance_to_object(lapindex.nextobj) / lapindex.disnext);
	else
		lapdis = 0;
	racepos = floor((lapindex.index + lapdis) * 100);
}
if global.panic
{
	instance_deactivate_object(obj_lapblock);
	instance_activate_object(obj_lapblockescape);
}
