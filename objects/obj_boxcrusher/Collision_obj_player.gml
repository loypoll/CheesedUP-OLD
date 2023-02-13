if (other.state == states.gotoplayer)
	exit;
if (sprite_index == spr_boxcrusher_fall)
{
	other.image_index = 0;
	other.state = 106;
	other.x = x;
	other.y = y;
}
else if (sprite_index == spr_boxcrusher_land)
{
	if (other.state != 33)
		create_transformation_tip(lang_get_value("boxxedtip"), "boxxed");
	other.boxxed = true;
	other.movespeed = 0;
	other.state = 33;
	if (other.sprite_index != other.spr_boxxedpepintro)
		other.sprite_index = other.spr_boxxedpepintro;
	other.image_index = 0;
	other.hsp = 0;
	other.vsp = 0;
	other.x = x;
	other.y = y - 20;
}
