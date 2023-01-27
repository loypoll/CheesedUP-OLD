if (instance_exists(ID))
{
	switch (ID.object_index)
	{
		case obj_swordstone:
			y = ID.y - 20;
			break;
		case obj_gustavograbbable:
			if (ID.state == 4)
				instance_destroy();
			x = ID.x;
			y = ID.y - 32;
			break;
		case obj_fakepepboss:
			if (ID.state != 134)
				visible = false;
			else
				visible = true;
			x = ID.x - 12;
			y = ID.y - 55;
			break;
	}
}
else if (ID != -4)
	instance_destroy();
