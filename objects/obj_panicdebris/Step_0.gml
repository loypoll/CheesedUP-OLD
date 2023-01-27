if (global.panic == 1 && start == 0)
{
	alarm[0] = 5;
	start = true;
}
if (global.panic == 0)
	alarm[0] = -1;
