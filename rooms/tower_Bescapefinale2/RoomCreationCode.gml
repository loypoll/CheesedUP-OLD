global.roommessage = "PIZZA TOWER ENTRANCE"
global.door_sprite = spr_door;
global.door_index = 0;
global.gameframe_caption_text = "Welcome back to the Pizza Tower!";
with (obj_player1)
{
	if (targetDoor == "C")
	{
		targetDoor = "HUB";
		verticalhallway = false;
		backtohubstartx = obj_doorC.x + 32;
		backtohubstarty = obj_doorC.y - 14;
		x = backtohubstartx;
		y = backtohubstarty - (obj_screensizer.actual_height * 2);
		state = states.backtohub;
		sprite_index = spr_slipbanan1;
		image_index = 10;
	}
}
