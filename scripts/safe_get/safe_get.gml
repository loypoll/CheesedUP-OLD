function safe_get(inst, variable)
{
	if instance_exists(inst) && variable_instance_exists(inst, variable)
		return variable_instance_get(inst, variable);
	return undefined;
}
