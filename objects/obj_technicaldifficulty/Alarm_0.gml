use_static = true;
static_index = sprite_get_number(spr_tvstatic) - 1;
static_dir = -1;
sound_play("event:/sfx/ui/tvswitchback");
event_user(0);
