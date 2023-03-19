function scr_initenemy()
{
	chargesnd = fmod_event_create_instance("event:/sfx/enemies/charge");
	pizzaheadKO = -4;
	pizzaheadKO_ID = -4;
	pizzaheadKO_buffer = 0;
	pizzahead_maxsubhp = 3;
	pizzahead_subhp = pizzahead_maxsubhp;
	camzoom = 1;
	mach2 = false;
	steppy = false;
	santaID = -4;
	rattime = 0;
	platformid = -4;
	usepalette = false;
	blur_effect = 0;
	hsp_carry = 0;
	vsp_carry = 0;
	xscale = 1;
	yscale = 1;
	grav = 0.5;
	hsp = 0;
	vsp = 0;
	stunned = 0;
	alarm[0] = 150;
	roaming = true;
	flying = false;
	straightthrow = false;
	stomped = false;
	escapespawnID = -4;
	reset = false;
	bombreset = 0;
	hp = 1;
	maxhp = 1;
	grounded = true;
	hit_connected = false;
	flash = false;
	birdcreated = false;
	boundbox = false;
	hitboxcreate = false;
	important = false;
	heavy = false;
	depth = 0;
	grabbedby = 0;
	paletteselect = 0;
	spr_palette = palette_forknight;
	stuntouchbuffer = 0;
	scaredbuffer = 0;
	movespeed = 1;
	ragebuffer = 0;
	ragehitbox = false;
	ragedash = 0;
	ragecooldown = 0;
	img_angle = image_angle;
	steppy = 20;
	invtime = 0;
	invincible = false;
	bumpable = true;
	stompable = true;
	killbyenemy = true;
	groundpound = true;
	instantkillable = true;
	stunnable = true;
	parryable = true;
	destroyable = true;
	hittable = true;
	shakestun = true;
	supertauntable = true;
	pepperman_grab = false;
	stagger_buffer = -1;
	stagger_max = 45;
	stagger_jumpspeed = 4;
	stagger_movespeed = 1;
	stagger_dir = 1;
	hitLag = 25;
	hitX = x;
	hitY = y;
	hitvsp = 0;
	hithsp = 0;
	dodgebuffer = 0;
	arcprojectiletimer = 0;
	escape = false;
	escapestun = true;
	oggrav = 0.5;
	arena = false;
	wave = 0;
	rage = false;
	instakilled = false;
	killprotection = false;
	mach3destroy = false;
	provoked = false;
	is_controllable = false;
	possess_movespeed = 0;
	stuntouch_yoffset = 0;
	turnmax = 200;
	turntimer = 0;
	turnstart = false;
	timedgate = false;
	chargeID = -4;
	angle = image_angle;
	is_controllable = false;
	possess_movespeed = 0;
	grav = 0.5;
	hsp = 0;
	vsp = 0;
	state = states.walk;
	stunned = 0;
	alarm[0] = 150;
	roaming = true;
	collectdrop = 5;
	flying = false;
	straightthrow = false;
	cigar = false;
	cigarcreate = false;
	stomped = false;
	shot = false;
	reset = false;
	flash = false;
	thrown = false;
	hp = 1;
	slapped = false;
	grounded = true;
	birdcreated = false;
	boundbox = false;
	spr_dead = spr_slimedead;
	important = false;
	heavy = false;
	depth = 0;
	paletteselect = 0;
	spr_palette = palette_cheeseslime;
	grabbedby = 0;
	stuntouchbuffer = 0;
	scaredbuffer = 0;
	railmovespeed = 0;
	use_collision = true;
	turner = false;
	elite = false;
	elitehit = 0;
	elitegrab = false;
	elitehurt = true;
	ventilator_vsp = -5;
	linethrown = false;
	dashcloudid = obj_null;
	player_instakillmove = false;
	stompbuffer = 0;
	killbyenemybuffer = 0;
	shoulderbashed = false;
}
