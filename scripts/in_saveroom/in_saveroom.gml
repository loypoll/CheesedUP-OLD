function in_saveroom(ID)
{
	if ds_list_find_index(global.saveroom, ID) != -1
	or ds_list_find_index(global.saveroom, real(string_digits(string(ID)))) != -1
	or ds_list_find_index(global.saveroom, string(ID)) != -1
		return true;
	return false;
}
