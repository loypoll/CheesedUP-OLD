function cutscene_customer_check(gnome, xbox, ybox, originalbox)
{
	with (obj_gnome_checklist)
		gnome_check[gnome] = true;
	global.pizzasdelivered++;
	if (instance_exists(obj_gnomecustomerblock))
		instance_destroy(obj_gnomecustomerblock);
	with (instance_create(xbox.x, ybox.y, obj_pizzaboxunopen))
	{
		content = originalbox.content;
		depth = xbox.depth;
		visible = false;
	}
	ds_list_add(global.saveroom, originalbox.id);
	cutscene_end_action();
}
function cutscene_customer_end()
{
	with (obj_customeractor)
		happy = true;
	cutscene_end_action();
}
