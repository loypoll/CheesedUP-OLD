event_inherited();
ds_map_set(player_hurtstates, 42, 30);
ds_map_set(player_hurtstates, 41, 50);
ds_map_set(player_hurtstates, 104, 20);
ds_map_set(player_hurtstates, 121, 30);
ds_map_set(player_hurtstates, 47, 60);
ds_map_set(boss_hurtstates, 244, 60);
ds_map_set(boss_hurtstates, 245, 50);
ds_map_set(boss_hurtstates, 246, 50);
ds_map_set(boss_hurtstates, 248, 50);
ds_map_set(boss_hurtstates, 249, 50);
hitlist = ds_list_create();
image_speed = 0.35;
max_hp = 3600;
hp = max_hp;
shot = false;
phase = 0;
has_attacked = false;
floatdir = 1;
attackbuffermax = 180;
attackbuffer = attackbuffermax;
phase1attacks = [226, 228, 227, 229];
lostattacks = array_length(phase1attacks);
parrycount = 0;
transitionstate = 0;
bombtimer = 0;
hasbomb = false;
bombgrabID = -4;
knightbuffer = 0;
spawnpool = [681, 646];
hitplayer = false;
function player_hurt()
{
	var _prevstate = state;
	if (phase < 2)
		SUPER_player_hurt(argument0, argument1);
	else if ((argument1.state != states.backbreaker || argument1.parry_inst == -4) && argument1.state != states.parry && ds_list_find_index(hitlist, argument1) == -1)
	{
		ds_list_add(hitlist, argument1);
		SUPER_player_hurt(argument0, argument1);
		state = _prevstate;
		hitplayer = true;
	}
}
function boss_hurt()
{
	if (phase == 0)
		SUPER_boss_hurt(argument0, argument1);
	else
	{
		var _removehp = true;
		with (argument1)
		{
			if (state != states.lungeattack && state != states.knightpep)
				scr_pummel();
			else if (state == states.knightpep && vsp > 0 && y < (other.y - 30))
			{
				sprite_index = spr_knightpep_doublejump;
				image_index = 0;
				vsp = -11;
				movespeed = 6;
			}
			else if (state != states.lungeattack && state != states.parry)
				_removehp = false;
			if (state == states.lungeattack)
				movespeed = 4;
		}
		if (_removehp)
			hp -= argument0;
	}
}
function boss_hurt_noplayer()
{
	if (inv_timer <= 0)
	{
		hp -= argument0;
		inv_timer = 10;
	}
}
