function cutscene_set_hsp(obj, hsp)
{
	var _obj = obj;
	var _hsp = hsp;
	with (_obj)
		hsp = _hsp;
	cutscene_end_action();
}
function cutscene_set_vsp(obj, vsp)
{
	with (obj)
		vsp = vsp;
	cutscene_end_action();
}
