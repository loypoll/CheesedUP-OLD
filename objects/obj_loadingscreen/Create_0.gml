group_arr = -4;
offload_arr = -4;
alarm[0] = 1;
depth = -601;
dark = false;
screenscale = 1;

blur_uniform = shader_get_uniform(shd_blur, "size");
scr_create_pause_image();
fade = 0;

sound_list = ds_list_create();
instance_list = ds_list_create();
scr_pause_deactivate_objects(false);
