ini_open_from_string(obj_savesystem.ini_str);
var save = "w3stick";
if (ini_read_real(save, "bosskey", false) == 0 or ini_read_real(save, "noisekey", false))
	instance_destroy();
ini_close();
