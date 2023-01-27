if (other.state != 42 && !hasgrabbed)
{
	if (other.state != 47 && other.state != 49)
		scr_hurtplayer(other);
}
else if (!move)
	event_inherited();
