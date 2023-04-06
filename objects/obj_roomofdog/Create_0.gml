hi = true;
if GM_build_type != "run"
{
	with all
		if id != other.id instance_destroy();
}
depth = -1600;
