windingAnim = 0;
facehurt = false;

// enemies through rooms
if !REMIX
	exit;
if baddiegrabbedID != 0 && baddiegrabbedID != obj_null && instance_exists(baddiegrabbedID)
&& baddiegrabbedID.state == states.grabbed
{
	with baddiegrabbedID
		persistent = true;
	with obj_baddiecollisionbox
		if baddieID == other.baddiegrabbedID
			persistent = true;
}
