with (other)
{
	if ((state == 16 || (state == states.chainsaw && tauntstoredstate == 16)) && other.visible == 1)
	{
		ghostdash = true;
		GamepadSetVibration(0, 0.6, 0.2);
		if (xscale > 0)
			ghostangle = 0;
		else
			ghostangle = 180;
		ghostpepper += 1;
		other.cooldown = 50;
		other.visible = false;
		repeat (2)
			create_debris(other.x, other.y, spr_flashdots, true);
	}
}
