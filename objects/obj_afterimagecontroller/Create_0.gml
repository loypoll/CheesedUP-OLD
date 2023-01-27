depth = 1;
global.afterimage_list = ds_list_create();
alpha = array_create(8, 1);
alpha[2] = 0.5;
shd_alpha = shader_get_uniform(12, "newAlpha");
shd_color_red = shader_get_uniform(2, "red");
shd_color_green = shader_get_uniform(2, "green");
shd_color_blue = shader_get_uniform(2, "blue");
