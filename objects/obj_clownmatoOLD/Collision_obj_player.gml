if (other.cutscene || other.state == 10)
	exit;
with (other)
{
	vsp = -18;
	sprite_index = spr_machfreefall;
	jumpstop = true;
	state = 92;
}
sprite_index = spr_clownmato_bounce;
image_index = 0;
