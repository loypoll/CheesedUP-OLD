savedhallwaydirection = hallwaydirection;
savedhallway = hallway;
savedvhallwaydirection = vhallwaydirection;
savedverticalhallway = verticalhallway;

with obj_secretportal
{
	if secret
	{
		if room != tower_soundtest && !instance_exists(obj_ghostcollectibles)
		{
			global.secretfound++;
			
			var val = global.secretfound;
			if val >= 3
				val = 3;
			
			if val == 1
				var txt = lang_get_value("secret_text1");
			else
				var txt = lang_get_value("secret_text2");
			
			txt = embed_value_string(txt, [val]);
			create_transformation_tip(txt);
			instance_create(0, 0, obj_ghostcollectibles);
			trace(instance_number(obj_ghostcollectibles));
		}
	}
}
if !is_bossroom()
	hitstunned = 0;

if global.levelreset
{
	//scr_playerreset();
	global.levelreset = false;
	instance_destroy(obj_comboend);
	instance_destroy(obj_combotitle);
	global.combodropped = false;
}
if room == tower_finalhallway && targetDoor == "C" && state == states.comingoutdoor
	state = states.normal;
if global.levelcomplete
{
	global.levelcomplete = false;
	global.leveltorestart = -4;
	global.leveltosave = -4;
	global.startgate = false;
}

if state == states.comingoutdoor && global.coop && !place_meeting(x, y, obj_exitgate)
{
	if object_index == obj_player1 && obj_player1.spotlight == 0
		visible = false;
	if object_index == obj_player2 && obj_player1.spotlight == 1
		visible = false;
}

if global.coop
{
	scr_changetoppings();
	if !instance_exists(obj_cooppointer)
		instance_create(x, y, obj_cooppointer);
	if !instance_exists(obj_coopflag)
		instance_create(x, y, obj_coopflag);
}

if state == states.grab && !REMIX
	state = states.normal;

if place_meeting(x, y, obj_boxofpizza) or place_meeting(x, y - 1, obj_boxofpizza)
{
	box = true;
	hallway = false;
	state = states.crouch;
}

if object_index != obj_player2 or global.coop
{
	var doortarget = noone;
	with obj_doorX
		if safe_get(id, "door") == other.targetDoor then doortarget = id;
	
	if instance_exists(doortarget)
	{
		if hallway
			x = doortarget.x + (hallwaydirection * 100);
		else if box
			x = doortarget.x + 32;
		else
			x = doortarget.x + 16 + (REMIX ? 2 : 0);
		y = doortarget.y - 14;
	}
}

if verticalhallway
{
	verticalbuffer = 2;
	
	var _vinst = -4;
	with obj_verticalhallway
	{
		event_perform(3, 0);
		if targetDoor == other.targetDoor
			_vinst = id;
	}
	
	if _vinst != noone
	{
		x = _vinst.x + (_vinst.sprite_width * vertical_x);
		var bbox_size = abs(bbox_right - bbox_left);
		x = clamp(x, _vinst.x + bbox_size, _vinst.bbox_right - bbox_size);
		trace(x, _vinst.x);
		
		if vhallwaydirection > 0
			y = _vinst.bbox_bottom + 32;
		else
			y = _vinst.bbox_top - 78;
		
		if verticalstate == states.climbwall
			state = states.climbwall;
		if state == states.climbwall
		{
			var xx = x;
			while !scr_solid(x + xscale, y)
			{
				x += xscale;
				if abs(x) > room_width
				{
					trace("wallclimbed out of bounds");
					x = xx;
					break;
				}
			}
		}
		y += verticalhall_vsp;
		vsp = verticalhall_vsp;
	}
	y += vhallwaydirection * 20;
	y = floor(y);
	
	verticalstate = states.normal;
}

if oldHallway
{
	x = player_x;
	y = player_y;
	
	if state == states.climbwall
	{
		var xx = x;
		while !scr_solid(x + xscale, y)
		{
			x += xscale;
			if abs(x) > room_width
			{
				trace("wallclimbed out of bounds");
				x = xx;
				break;
			}
		}
	}
}

if character == "M" && place_meeting(x, y, obj_boxofpizza)
{
	while place_meeting(x, y, obj_boxofpizza)
	{
		var _inst = instance_place(x, y, obj_boxofpizza);
		y -= _inst.image_yscale;
	}
}

if state == states.taxi
{
	x = obj_stopsign.x;
	y = obj_stopsign.y;
}
if state == states.spaceshuttle
{
	x = obj_spaceshuttlestop.x;
	y = obj_spaceshuttlestop.y;
}

hallway = false;
verticalhallway = false;
box = false;
oldHallway = false;

if isgustavo
	brick = true;

if place_meeting(x, y, obj_exitgate)
{
	global.prank_cankillenemy = true;
	with instance_place(x, y, obj_exitgate)
		other.x = x;
}

if (room == rank_room)
{
	x = rankpos_x;
	y = rankpos_y;
}

x = floor(x);
y = floor(y);
roomstartx = x;
roomstarty = y;

if (state == states.chainsaw)
{
	hitX = x;
	hitY = y;
	hitLag = 0;
}

smoothx = 0;

// bringing baddies through rooms
if !REMIX
	exit;
if baddiegrabbedID != 0 && baddiegrabbedID != obj_null && instance_exists(baddiegrabbedID)
{
	with baddiegrabbedID
		persistent = false;
	with obj_baddiecollisionbox
		if baddieID == other.baddiegrabbedID
			persistent = false;
}
