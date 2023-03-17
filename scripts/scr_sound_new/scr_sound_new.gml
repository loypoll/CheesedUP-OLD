function sound_pause_all(enable) {
	fmod_event_instance_set_paused_all(enable);
}
function sound_stop(event, force = true)
{
	var sound = ds_map_find_value(obj_fmod.sound_cache, event);
	if sound != undefined
		fmod_event_instance_stop(sound, force);
}
function sound_is_playing(event)
{
	var sound = ds_map_find_value(obj_fmod.sound_cache, event);
	if sound != undefined
		return fmod_event_instance_is_playing(sound);
}
function sound_stop_all(force = true)
{
	var sound = ds_map_find_first(obj_fmod.sound_cache);
	while sound != undefined
	{
		fmod_event_instance_stop(obj_fmod.sound_cache[? sound], force);
		sound = ds_map_find_next(obj_fmod.sound_cache, sound);
	}
}
function sound_play(event) {
	sound_play_3d(event);
}
function sound_play_3d(event, x = undefined, y = undefined)
{
	var sound = ds_map_find_value(obj_fmod.sound_cache, event);
	if sound == undefined
	{
		sound = fmod_event_create_instance(event);
		ds_map_add(obj_fmod.sound_cache, event, sound);
	}
	fmod_event_instance_set_paused(sound, false);
	if x != undefined && y != undefined
		fmod_event_instance_set_3d_attributes(sound, x, y);
	fmod_event_instance_play(sound);
}
function sound_play_centered(event) {
	sound_play_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_centered_oneshot(event) {
	fmod_event_one_shot_3d(event, camera_get_view_x(view_camera[0]) + 960 / 2, camera_get_view_y(view_camera[0]) + 540 / 2);
}
function sound_play_oneshot(event) {
	fmod_event_one_shot(event);
}
function sound_play_multiple(event, x = undefined, y = undefined)
{
	if x != undefined && y != undefined
		fmod_event_one_shot_3d(event, x, y);
	else
		fmod_event_one_shot(event);
}
