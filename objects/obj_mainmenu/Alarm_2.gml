/// @description debug skip
if obj_savesystem.state != 0
{
	alarm[2] = 1;
	exit;
}
instance_destroy(obj_option);
fmod_event_instance_stop(obj_music.music.event, true);

instance_create(x, y, obj_fadeout);
with (obj_player)
{
	targetRoom = hub_loadingscreen;
	targetDoor = "A";
}
gamesave_async_load();
