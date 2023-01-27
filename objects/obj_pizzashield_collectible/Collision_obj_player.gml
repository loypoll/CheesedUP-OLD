if (other.state != 186)
{
	scr_sound_multiple("event:/sfx/misc/collect", x, y);
	with (other)
		pizzashield = true;
	instance_destroy();
}
