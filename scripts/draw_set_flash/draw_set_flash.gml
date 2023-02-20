function draw_set_flash(enable, col = merge_colour(c_red, c_white, 0.9))
{
	if shader_current() == shd_alphafix
		shader_reset();
	gpu_set_fog(enable, col, 0, 1);
}
