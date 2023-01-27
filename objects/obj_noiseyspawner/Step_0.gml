var b = false;
with (obj_bosscontroller)
{
	if (state == 144)
		b = false;
}
with (obj_noisey)
	b = false;
with (obj_noiseboss)
{
	if (state == 144 || state == 138 || wastedhits >= 6)
		b = false;
}
if (b)
{
	if (spawnbuffer > 0)
		spawnbuffer--;
	else
	{
		spawnbuffer = spawnmax;
		with (instance_create(disx1, -64, obj_noisey))
		{
			important = true;
			x_to = other.disx2;
			y_to = irandom_range(other.disy1, other.disy2);
			state = 149;
			bounce = true;
			stunned = 10;
		}
	}
}
