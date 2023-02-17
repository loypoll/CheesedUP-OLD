function cutscene_customer_check(argument0, argument1, argument2, argument3)
{
	with (obj_gnome_checklist)
		gnome_check[argument0] = true;
	global.pizzasdelivered++;
	if (instance_exists(obj_gnomecustomerblock))
		instance_destroy(obj_gnomecustomerblock);
	with (instance_create(argument1.x, argument1.y, obj_pizzaboxunopen))
	{
		content = argument3.content;
		depth = argument1.depth;
		visible = false;
	}
	ds_list_add(global.saveroom, argument3.id);
	cutscene_end_action();
}
function cutscene_customer_end(argument0)
{
	with (obj_customeractor)
		happy = true;
	cutscene_end_action();
}
