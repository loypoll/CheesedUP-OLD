prevhsp = hsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;
if (key_slap2)
	input_buffer_shoot = 10;
if (key_slap2)
	input_buffer_slap = 12;
if (key_jump)
	input_buffer_jump = 15;
if (grounded && vsp > 0)
	coyote_time = 8;
if (vsp < 0)
	coyote_time = 0;
can_jump = (grounded && vsp > 0) || (coyote_time && vsp > 0);
var prevmask = mask_index;
if (state != 79)
	swingdingthrow = false;
collision_flags = 0;
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	collision_flags |= 1;
if (scr_solid(x, y + 1))
	collision_flags |= 4;
if (place_meeting(x, y + 1, obj_slope))
	collision_flags |= 2;
switch (state)
{
	case 0:
		scr_player_normal();
		break;
	case 1:
		scr_player_revolver();
		break;
	case 2:
		scr_player_dynamite();
		break;
	case 3:
		scr_player_boots();
		break;
	case 4:
		scr_player_grabbed();
		break;
	case 6:
		scr_player_finishingblow();
		break;
	case 5:
		scr_player_tumble();
		break;
	case 18:
		scr_player_titlescreen();
		break;
	case 7:
		scr_player_ejected();
		break;
	case 10:
		scr_player_firemouth();
		break;
	case 9:
		scr_player_fireass();
		break;
	case 8:
		scr_player_transitioncutscene();
		break;
	case 19:
		scr_playerN_hookshot();
		break;
	case 23:
		scr_player_slap();
		break;
	case 20:
		scr_player_tacklecharge();
		break;
	case 24:
		scr_player_cheesepep();
		break;
	case 26:
		scr_player_cheesepepjump();
		break;
	case 27:
		scr_player_cheesepepfling();
		break;
	case 21:
		scr_player_cheeseball();
		break;
	case 22:
		scr_player_cheeseballclimbwall();
		break;
	case 29:
		scr_player_cheesepepstickside();
		break;
	case 30:
		scr_player_cheesepepstickup();
		break;
	case 25:
		scr_player_cheesepepstick();
		break;
	case 28:
		scr_player_cheesepeplaunch();
		break;
	case 33:
		scr_player_boxxedpep();
		break;
	case 35:
		scr_player_boxxedpepjump();
		break;
	case 34:
		scr_player_boxxedpepspin();
		break;
	case 36:
		scr_player_pistolaim();
		break;
	case 37:
		scr_player_climbwall();
		break;
	case 38:
		scr_player_knightpepslopes();
		break;
	case 39:
		scr_player_portal();
		break;
	case 40:
		scr_player_secondjump();
		break;
	case 41:
		scr_player_chainsawbump();
		break;
	case 42:
		scr_player_handstandjump();
		break;
	case 43:
		scr_player_lungeattack();
		break;
	case 44:
		scr_player_lungegrab();
		break;
	case 45:
		scr_player_dashtumble();
		break;
	case 153:
		scr_player_shoulderbash();
		break;
	case 46:
		scr_player_gottreasure();
		break;
	case 47:
		scr_player_knightpep();
		break;
	case 48:
		scr_player_knightpepattack();
		break;
	case 49:
		scr_player_knightpepbump();
		break;
	case 50:
		scr_player_meteorpep();
		break;
	case 51:
		scr_player_bombpep();
		break;
	case 54:
		scr_player_bombpepup();
		break;
	case 53:
		scr_player_bombpepside();
		break;
	case 52:
		scr_player_bombgrab();
		break;
	case 55:
		scr_player_grabbing();
		break;
	case 56:
		scr_player_chainsawpogo();
		break;
	case 57:
		scr_player_shotgunjump();
		break;
	case 59:
		scr_player_stunned();
		break;
	case 60:
		scr_player_highjump();
		break;
	case 61:
		scr_player_chainsaw();
		break;
	case 137:
		scr_player_hit();
		break;
	case 156:
		scr_player_thrown();
		break;
	case 62:
		scr_player_facestomp();
		break;
	case 64:
		scr_player_timesup();
		break;
	case 65:
		scr_player_machroll();
		break;
	case 72:
		scr_player_pistol();
		break;
	case 66:
		scr_player_shotgun();
		break;
	case 67:
		scr_player_shotguncrouch();
		break;
	case 68:
		scr_player_shotguncrouchjump();
		break;
	case 69:
		scr_player_shotgunshoot();
		break;
	case 71:
		scr_player_shotgunfreefall();
		break;
	case 70:
		scr_player_shotgundash();
		break;
	case 73:
		scr_player_machfreefall();
		break;
	case 74:
		scr_player_throwing();
		break;
	case 76:
		scr_player_superslam();
		break;
	case 75:
		scr_player_slam();
		break;
	case 77:
		scr_player_skateboard();
		break;
	case 78:
		scr_player_grind();
		break;
	case 79:
		scr_player_grab();
		break;
	case 80:
		scr_player_punch();
		break;
	case 81:
		scr_player_backkick();
		break;
	case 82:
		scr_player_uppunch();
		break;
	case 83:
		scr_player_shoulder();
		break;
	case 84:
		scr_player_backbreaker();
		break;
	case 85:
		scr_player_graffiti();
		break;
	case 86:
		scr_player_bossdefeat();
		break;
	case 88:
		scr_player_bossintro();
		break;
	case 96:
		scr_player_smirk();
		break;
	case 87:
		scr_player_pizzathrow();
		break;
	case 89:
		scr_player_gameover();
		break;
	case 123:
		scr_player_Sjumpland();
		break;
	case 122:
		scr_player_freefallprep();
		break;
	case 120:
		scr_player_runonball();
		break;
	case 118:
		scr_player_boulder();
		break;
	case 90:
		scr_player_keyget();
		break;
	case 91:
		scr_player_tackle();
		break;
	case 94:
		scr_player_slipnslide();
		break;
	case 93:
		scr_player_ladder();
		break;
	case 92:
		scr_player_jump();
		break;
	case 98:
		scr_player_victory();
		break;
	case 95:
		scr_player_comingoutdoor();
		break;
	case 97:
		scr_player_Sjump();
		break;
	case 99:
		scr_player_Sjumpprep();
		break;
	case 100:
		scr_player_crouch();
		break;
	case 101:
		scr_player_crouchjump();
		break;
	case 102:
		scr_player_crouchslide();
		break;
	case 103:
		scr_player_mach1();
		break;
	case 104:
		scr_player_mach2();
		break;
	case 121:
		scr_player_mach3();
		break;
	case 105:
		scr_player_machslide();
		break;
	case 106:
		scr_player_bump();
		break;
	case 107:
		scr_player_hurt();
		break;
	case 108:
		scr_player_freefall();
		break;
	case 111:
		scr_player_freefallland();
		break;
	case 109:
		scr_player_hang();
		break;
	case 112:
		scr_player_door();
		break;
	case 113:
		scr_player_barrel();
		break;
	case 114:
		scr_player_barreljump();
		break;
	case 116:
		scr_player_barrelslide();
		break;
	case 115:
		scr_player_barrelclimbwall();
		break;
	case 117:
		scr_player_current();
		break;
	case 119:
		scr_player_taxi();
		break;
	case 152:
		scr_player_taxi();
		break;
	case 58:
		scr_player_pogo();
		break;
	case 31:
		scr_player_rideweenie();
		break;
	case 32:
		scr_player_motorcycle();
		break;
	case 124:
		scr_player_faceplant();
		break;
	case 16:
		scr_player_ghost();
		break;
	case 17:
		scr_player_ghostpossess();
		break;
	case 11:
		scr_player_mort();
		break;
	case 12:
		scr_player_mortjump();
		break;
	case 13:
		scr_player_mortattack();
		break;
	case 14:
		scr_player_morthook();
		break;
	case 15:
		scr_player_hook();
		break;
	case 144:
		scr_player_arenaintro();
		break;
	case 146:
		scr_player_actor();
		break;
	case 147:
		scr_player_parry();
		break;
	case 148:
		scr_player_golf();
		break;
	case 150:
		scr_player_tube();
		break;
	case 154:
		scr_player_pummel();
		break;
	case 165:
		scr_player_slipbanan();
		break;
	case 183:
		scr_player_bombdelete();
		break;
	case 184:
		scr_player_rocket();
		break;
	case 185:
		scr_player_rocketslide();
		break;
	case 186:
		scr_player_gotoplayer();
		break;
	case 187:
		scr_player_trickjump();
		break;
	case 190:
		scr_player_ridecow();
		break;
	case 191:
		scr_player_ratmount();
		break;
	case 196:
		scr_player_ratmounthurt();
		break;
	case 192:
		scr_player_ratmountjump();
		break;
	case 193:
		scr_player_ratmountattack();
		break;
	case 194:
		scr_player_ratmountspit();
		break;
	case 195:
		scr_player_ratmountclimbwall();
		break;
	case 197:
		scr_player_ratmountgroundpound();
		break;
	case 198:
		scr_player_ratmountbounce();
		break;
	case 200:
		scr_player_ratmountballoon();
		break;
	case 202:
		scr_player_ratmountgrind();
		break;
	case 201:
		scr_player_ratmounttumble();
		break;
	case 259:
		scr_player_ratmountpunch();
		break;
	case 203:
		scr_player_ratmounttrickjump();
		break;
	case 204:
		scr_player_ratmountskid();
		break;
	case 206:
		scr_player_blockstance();
		break;
	case 207:
		scr_player_balloon();
		break;
	case 208:
		scr_player_debugstate();
		break;
	case 210:
		scr_player_trashjump();
		break;
	case 211:
		scr_player_trashroll();
		break;
	case 212:
		scr_player_stringfling();
		break;
	case 213:
		scr_player_stringjump();
		break;
	case 214:
		scr_player_stringfall();
		break;
	case 215:
		scr_player_noisejetpack();
		break;
	case 216:
		scr_player_spiderweb();
		break;
	case 225:
		scr_player_animatronic();
		break;
	case 252:
		scr_player_playersuperattack();
		break;
	case 254:
		scr_player_jetpackjump();
		break;
	case 257:
		scr_player_bee();
		break;
	case 260:
		scr_player_ratmountcrouch();
		break;
	case 261:
		scr_player_ratmountladder();
		break;
	case 265:
		scr_player_antigrav();
		break;
	case 270:
		scr_player_estampede();
		break;
	case 290:
		scr_player_backtohub();
		break;
	case 293:
		scr_player_animation();
		break;
	case 262:
		scr_player_supergrab();
		break;
}
if (state != 61)
{
	if (!bodyslam_notif)
	{
		if (state == 108)
		{
			bodyslam_notif = true;
			notification_push(notifs.bodyslam_start, [room]);
		}
	}
	else if (state != 108)
	{
		bodyslam_notif = false;
		notification_push(notifs.bodyslam_end, [room]);
	}
}
if (state == 97 || (state == 61 && tauntstoredstate == 97))
	sjumptimer++;
else if (sjumptimer > 0)
{
	notification_push(notifs.superjump_timer, [sjumptimer, room]);
	sjumptimer = 0;
}
if (invtime > 0)
	invtime--;
if (sprite_index == spr_noise_phasetrans1P && image_index > 24)
{
	if (!noisebossscream)
	{
		fmod_event_one_shot_3d("event:/sfx/pep/screamboss", x, y);
		fmod_event_one_shot_3d("event:/sfx/voice/noisescream", obj_noiseboss.x, obj_noiseboss.y);
		noisebossscream = true;
	}
}
else if (sprite_index != spr_noise_phasetrans1P)
    noisebossscream = false;
if (global.pistol && state != 293 && state != 146 && state != 107 && state != 106)
{
	if (key_slap || pistolchargeshooting)
		pistolcharge += 0.5;
	else
	{
		pistolcharge = 0;
		pistolchargeshot = 1;
	}
	if (pistolcharge > 0)
	{
		var ixa = [6, 14, 22, 30, 38];
		var _sound = false;
		for (var i = 0; i < array_length(ixa); i++)
		{
			if (floor(pistolcharge) == ixa[i])
				_sound = true;
		}
		if (_sound && !pistolchargesound)
		{
			pistolchargesound = true;
			fmod_event_one_shot_3d("event:/sfx/pep/revolvercharge", x, y);
		}
		else if (!_sound)
			pistolchargesound = false;
	}
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
		pistolcharge = sprite_get_number(spr_revolvercharge) - 1;
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 16) && !pistolchargeshooting)
	{
		pistolchargeshooting = true;
		pistolchargeshot = 1;
	}
	if (pistolchargeshot > 0 && pistolchargeshooting)
	{
		if (state != 84 && state != 61)
		{
			scr_pistolshoot(0);
			pistolchargedelay = 5;
			pistolchargeshot--;
		}
	}
	else if (pistolchargeshot <= 0 && pistolchargeshooting)
	{
		pistolcharge = 0;
		pistolchargedelay = 5;
		pistolchargeshooting = false;
		pistolchargeshot = 1;
		if (key_slap)
			pistolcharge = 4;
	}
}
else if (state == 107 || state == 106 || instance_exists(obj_vigilante_duelintro))
{
	pistolcharge = 0;
	pistolcharged = false;
	pistolchargeshooting = false;
	pistolchargeshot = 1;
}
if (pistolanim != -4)
{
	pistolindex += 0.35;
	if (!machslideAnim && state != 105)
	{
		sprite_index = pistolanim;
		image_index = pistolindex;
	}
	if (floor(pistolindex) == (sprite_get_number(pistolanim) - 1))
	{
		pistolanim = -4;
		pistolindex = 0;
	}
}
if (pistolcooldown > 0)
	pistolcooldown--;
if (prevstate != state)
{
	if (prevstate == 211 && state != 61 && prevsprite != 2304 && prevsprite != 2184)
		create_debris(x, y, spr_player_trashlid);
	if (prevstate == 16 && state != 61)
		instance_create(x, y, obj_ghostdrapes);
}
if (!place_meeting(x, y + 1, obj_railparent))
{
	if (state == 121 || state == 104 || state == 5)
		railmovespeed = Approach(railmovespeed, 0, 0.1);
	else
		railmovespeed = Approach(railmovespeed, 0, 0.5);
}
if (state != 42 && state != 5)
	crouchslipbuffer = 0;
if (state != 121 && (state != 61 || tauntstoredstate != 121))
	mach4mode = false;
if (ratshootbuffer > 0)
	ratshootbuffer--;
if (state != 225)
{
	animatronic_buffer = 180;
	animatronic_collect_buffer = 0;
}
if (state == 33 && grounded && vsp > 0)
	boxxedpepjump = boxxedpepjumpmax;
if (verticalbuffer > 0)
	verticalbuffer--;
if (superchargecombo_buffer > 0)
	superchargecombo_buffer--;
else if (superchargecombo_buffer == 0)
{
	superchargecombo_buffer = -1;
	global.combotime = 4;
}
if (state != 0)
	breakdance_speed = 0.25;
if (holycross > 0)
	holycross--;
if (global.noisejetpack)
{
	if (jetpackeffect > 0)
		jetpackeffect--;
	else
	{
		jetpackeffect = 100;
		repeat (10)
			instance_create(x, y, obj_firemouthflame);
	}
}
if ((state == 92 || state == 0 || state == 104 || state == 121 || state == 187) && global.noisejetpack == 1)
{
	if ((!can_jump && key_jump) || (grounded && key_jump && key_up))
	{
		fmod_event_instance_play(pizzapeppersnd);
		scr_fmod_soundeffect(jumpsnd, x, y);
		fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
		if (key_down)
			vsp = 0;
		else
			vsp = -11;
		if (move != 0)
		{
			if (movespeed < 10)
				movespeed = 10;
		}
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust;
		scr_do_pepperpizzajump();
	}
}
if (walljumpbuffer > 0)
	walljumpbuffer--;
if (grounded && vsp > 0 && state != 215)
	jetpackfuel = jetpackmax;
if (tauntstoredisgustavo)
{
	isgustavo = true;
	if (state != 84 && state != 147 && state != 85)
		tauntstoredisgustavo = false;
}
if (state != 121 && (state != 105 || sprite_index != spr_mach3boost))
{
	launch = false;
	launched = false;
	launch_buffer = 0;
}
if (launch_buffer > 0)
	launch_buffer--;
else
	launched = false;
if (state != 6)
	finishingblow = false;
if (dash_doubletap > 0)
	dash_doubletap--;
if (cow_buffer > 0)
	cow_buffer--;
if (state == 43)
	lunge_buffer = 14;
if (blur_effect > 0)
	blur_effect--;
else if (breakdance_speed >= 0.6 || (state == 165 && sprite_index == spr_rockethitwall) || mach4mode == 1 || boxxeddash == 1 || state == 16 || state == 5 || state == 198 || state == 193 || state == 42 || (state == 116 || (state == 79 && sprite_index == spr_swingding && swingdingdash <= 0) || state == 108 || state == 43 || state == 203 || state == 187))
{
	if (visible && (collision_flags & 1) == 0)
	{
		blur_effect = 2;
		with (create_blur_afterimage(x, y, sprite_index, image_index - 1, xscale))
			playerid = other.id;
	}
}
if (state != 61 && state != 106 && state != 33 && state != 34 && state != 35)
{
	boxxed = false;
	boxxeddash = false;
}
if (state != 79)
	grabbingenemy = false;
if (state != 104 && state != 121 && state != 187 && state != 201 && state != 203)
{
	ramp = false;
	ramp_points = false;
}
if (state != 112 && state != 61 && state != 137 && place_meeting(x, y, obj_boxofpizza))
	state = 100;
if (shoot_buffer > 0)
	shoot_buffer--;
if (cheesepep_buffer > 0)
	cheesepep_buffer--;
if (state != 29)
	yscale = 1;
if (invhurt_buffer > 0)
	invhurt_buffer--;
if (state == 107)
{
	if (hurt_buffer > 0)
		hurt_buffer--;
	else
	{
		invhurt_buffer = invhurt_max;
		hurt_buffer = -1;
	}
}
else
{
	if (hurt_buffer > 0)
		invhurt_buffer = invhurt_max;
	hurt_buffer = -1;
}
if ((room == Realtitlescreen && instance_exists(obj_mainmenuselect)) || room == Mainmenu || room == Longintro || room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
	state = 18;
if (wallclingcooldown < 10)
	wallclingcooldown++;
if (boxxedspinbuffer > 0)
	boxxedspinbuffer--;
if (supercharged && (collision_flags & 1) == 0)
{
	if (superchargebuffer > 0)
		superchargebuffer--;
	else if (state == 0 || state == 92 || state == 103 || state == 104 || state == 121 || state == 191 || state == 192 || state == 198 || state == 204)
	{
		superchargebuffer = 4;
		with (instance_create(x + irandom_range(-25, 25), y + irandom_range(-10, 35), obj_superchargeeffect))
			playerid = other.id;
	}
}
if (state != 97)
	sjumpvsp = -12;
if (state != 108)
	freefallvsp = 20;
if (supercharge > 9 && state != 84)
{
	if (!supercharged)
	{
		ini_open_from_string(obj_savesystem.ini_str);
		if (ini_read_real("Game", "supertaunt", false) == 0)
			create_transformation_tip(lang_get_value("supertaunttip"));
		ini_close();
		fmod_event_one_shot("event:/sfx/pep/gotsupertaunt");
	}
	supercharged = true;
}
if (!instance_exists(pizzashieldid) && pizzashield == 1)
{
	with (instance_create(x, y, obj_pizzashield))
	{
		playerid = other.object_index;
		other.pizzashieldid = id;
	}
}
if (visible == 0 && state == 95)
{
	coopdelay++;
	image_index = 0;
	if (coopdelay == 50)
	{
		visible = true;
		coopdelay = 0;
	}
}
if (global.coop == 1)
{
	if ((state == 80 || state == 42) && !(obj_player2.state == 80 || obj_player2.state == 42))
		fightballadvantage = true;
	else if (!(obj_player2.state == 80 || obj_player2.state == 42))
		fightballadvantage = false;
}
if (state != 58 && state != 84)
{
	pogospeed = 6;
	pogospeedprev = false;
}
scr_playersounds();
if (grounded)
	doublejump = false;
if (pogochargeactive == 1)
{
	if (flashflicker == 0)
	{
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
			sprite_index = spr_playerN_pogofallmach;
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
			sprite_index = spr_playerN_pogobouncemach;
	}
	flashflicker = true;
	pogocharge--;
}
else
	flashflicker = false;
if (state != 74)
	kickbomb = false;
if (pogocharge == 0)
{
	pogochargeactive = false;
	pogocharge = 100;
}
if (flashflicker == 1)
{
	flashflickertime++;
	if (flashflickertime == 20)
	{
		flash = true;
		flashflickertime = 0;
	}
}
if (state != 121 && state != 4)
	fightball = false;
if (state != 4 && state != 107)
{
	if (grounded && state != 55)
		suplexmove = false;
}
if (state != 108 && state != 76 && (state != 61 || (tauntstoredstate != 108 && tauntstoredstate != 76)) && (state != 84 || (tauntstoredstate != 108 && tauntstoredstate != 76)))
	freefallsmash = -14;
if (global.playerhealth <= 0 && state != 89)
{
	image_index = 0;
	sprite_index = spr_playerV_dead;
	state = 89;
}
if (state == 89 && y > (room_height * 2) && !instance_exists(obj_backtohub_fadeout))
{
	targetDoor = "HUB";
	scr_playerreset();
	if (global.coop == 1)
	{
		with (obj_player2)
		{
			scr_playerreset();
			targetDoor = "HUB";
		}
	}
	with (obj_player1)
	{
		image_index = 0;
		image_blend = c_white;
		visible = true;
	}
	instance_create(0, 0, obj_backtohub_fadeout);
	global.leveltorestart = -4;
	global.leveltosave = -4;
	global.startgate = 0;
}
if (baddiegrabbedID == obj_null && (state == 79 || state == 76 || state == 20))
	state = 0;
if (cutscene == 1 && state != 186)
	global.heattime = 60;
if (anger == 0)
	angry = false;
if (anger > 0)
{
	angry = true;
	anger -= 1;
}
if (sprite_index == spr_winding && state != 0)
	windingAnim = 0;
if (state != 79)
	swingdingbuffer = 0;
if (state == 265 || state == 184 || state == 185)
	grav = 0;
else if (state == 113)
	grav = 0.6;
else if (state == 16 || state == 17)
	grav = 0;
else if (boxxed)
	grav = 0.3;
else if (sprite_index == spr_player_jetpackstart2)
	grav = 0.4;
else if (state == 34)
	grav = 0.6;
else
	grav = 0.5;
if (state == 113 && key_jump2 && !jumpstop)
	grav = 0.4;
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
	instance_create(x + random_range(-5, 5), y + 46, obj_vomit);
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
	with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
		sprite_index = spr_vomit2;
}
if (global.combo >= 25 && !instance_exists(angryeffectid) && state == 0 && character != "V")
{
	with (instance_create(x, y, obj_angrycloud))
	{
		playerid = other.object_index;
		other.angryeffectid = id;
	}
}
if (object_index == obj_player1)
{
	if (global.combotimepause > 0)
		global.combotimepause--;
	if (global.combo != global.previouscombo && !is_bossroom())
	{
		if (global.combo > global.highest_combo)
			global.highest_combo = global.combo;
		global.previouscombo = global.combo;
		if ((global.combo % 5) == 0 && global.combo != 0)
		{
			instance_destroy(obj_combotitle);
			with (instance_create(x, y - 80, obj_combotitle))
			{
				title = floor(global.combo / 5);
				event_perform(3, 0);
			}
		}
	}
	if (!(state == 112 || state == 297 || state == 66 || state == 150 || state == 292 || state == 119 || state == 46 || state == 98 || state == 46 || state == 146 || state == 95 || (state == 47 && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || (collision_flags & 1) > 0))
	{
		if (global.combotime > 0 && global.combotimepause <= 0)
			global.combotime -= 0.15;
	}
	if (global.heattime > 0)
		global.heattime -= 0.15;
	if (global.combotime <= 0 && global.combo >= 1)
	{
		if (global.combo >= 1)
			fmod_event_one_shot("event:/sfx/misc/kashingcombo");
		global.savedcombo = global.combo;
		global.combotime = 0;
		global.combo = 0;
		supercharge = 0;
	}
	if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
		global.style -= 0.05;
}
if (key_jump && !grounded && (state == 104 || state == 121) && (state != (37 & walljumpbuffer)) <= 0)
	input_buffer_walljump = 24;
if (boxxeddashbuffer > 0)
	boxxeddashbuffer--;
if (coyote_time > 0)
	coyote_time--;
if (input_buffer_jump > 0)
	input_buffer_jump--;
if (input_buffer_jump_negative > 0)
	input_buffer_jump_negative--;
if (input_buffer_secondjump < 8)
	input_buffer_secondjump++;
if (input_buffer_highjump < 8)
	input_buffer_highjump++;
if (input_attack_buffer > 0)
	input_attack_buffer--;
if (input_buffer_shoot > 0)
	input_buffer_shoot--;
if (input_finisher_buffer > 0)
	input_finisher_buffer--;
if (input_up_buffer > 0)
	input_up_buffer--;
if (input_down_buffer > 0)
	input_down_buffer--;
if (input_buffer_walljump > 0)
	input_buffer_walljump--;
if (input_buffer_slap > 0)
	input_buffer_slap--;
if (key_particles == 1)
	create_particle(x + random_range(-25, 25), y + random_range(-35, 25), particle.keyparticles, 0);
if (state != 191 && state != 192 && state != 61)
{
	gustavodash = 0;
	ratmount_movespeed = 8;
}
if (inv_frames == 0 && hurted == 0 && state != 16)
	image_alpha = 1;
if (state == 80 || (state == 92 && sprite_index == spr_playerN_noisebombspinjump) || state == 20 || state == 77 || state == 47 || state == 24 || state == 38 || state == 48 || state == 51 || state == 62 || state == 73 || state == 62 || state == 121 || state == 108 || state == 97)
	attacking = true;
else
	attacking = false;
if (state == 74 || state == 81 || state == 83 || state == 82)
	grabbing = true;
else
	grabbing = false;
if ((state == 198 && vsp >= 0) || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == 34 || state == 211 || state == 210 || state == 70 || (state == 71 && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == 97 || state == 184 || state == 185 || state == 41 || (state == 80 && ((sprite_index != spr_player_breakdanceuppercut && sprite_index != spr_player_breakdanceuppercutend) || vsp < 0)) || state == 124 || state == 31 || state == 121 || (state == 92 && sprite_index == spr_playerN_noisebombspinjump) || state == 108 || state == 9 || state == 254 || (state == 10 && sprite_index != spr_firemouthintro) || state == 19 || state == 254 || state == 77 || state == 63 || state == 97 || state == 73 || state == 20 || (state == 76 && sprite_index == spr_piledriver) || state == 47 || state == 48 || state == 38 || state == 187 || state == 24 || state == 21 || state == 201 || state == 197 || global.noisejetpack == 1 || state == 259 || state == 265 || holycross > 0 || state == 116 || state == 115 || ratmount_movespeed >= 12 || ghostdash == 1 || state == 165 || state == 153 || (state == 105 && (sprite_index == spr_mach3boost || sprite_index == spr_player_machslideboost3fall)))
	instakillmove = true;
else
	instakillmove = false;
if ((global.noisejetpack || holycross > 0) && (state == 146 || state == 61 || state == 84 || state == 186 || state == 293 || state == 144 || state == 297 || state == 123))
	instakillmove = false;
if (state == 198 && vsp < 0)
	stunmove = true;
else
	stunmove = false;
if (flash == 1 && alarm[0] <= 0)
	alarm[0] = 0.15 * room_speed;
if (state != 93)
	hooked = false;
if (state != 121 && state != 105)
	autodash = false;
if ((state != 92 && state != 101 && state != 23) || vsp < 0)
	fallinganimation = 0;
if (state != 111 && state != 0 && state != 105 && state != 92)
	facehurt = false;
if (state != 0 && state != 105)
	machslideAnim = false;
if (state != 0 && state != 191)
{
	idle = 0;
	dashdust = false;
}
if (state != 103 && state != 26 && state != 92 && state != 19 && state != 42 && state != 0 && state != 104 && state != 121 && state != 122 && state != 47 && state != 66 && state != 38)
	momemtum = false;
if (state != 97 && state != 99)
	a = 0;
if (state != 62)
	facestompAnim = false;
if (state != 108 && state != 62 && state != 76 && state != 111)
	superslam = 0;
if (state != 104)
	machpunchAnim = false;
if (ladderbuffer > 0)
	ladderbuffer--;
if (state != 92)
	stompAnim = false;
if (state == 121 || (state == 16 && ghostdash && ghostpepper >= 3) || state == 104 || state == 97 || ratmount_movespeed >= 12 || gusdashpadbuffer > 0)
{
	if (macheffect == 0)
	{
		macheffect = true;
		toomuchalarm1 = 6;
		with (create_mach3effect(x, y, sprite_index, image_index - 1))
		{
			playerid = other.object_index;
			image_xscale = other.xscale;
		}
	}
}
if (!isgustavo)
	gusdashpadbuffer = 0;
if (!(state == 121) && !(state == 104) && ratmount_movespeed < 12 && (state != 16 || ghostpepper < 2) && gusdashpadbuffer <= 0 && state != 97)
	macheffect = false;
if (toomuchalarm1 > 0)
{
	toomuchalarm1 -= 1;
	if (toomuchalarm1 <= 0 && (state == 121 || (state == 16 && ghostdash == 1 && ghostpepper >= 3) || state == 104 || state == 97 || ratmount_movespeed >= 12 || gusdashpadbuffer > 0))
	{
		with (create_mach3effect(x, y, sprite_index, image_index - 1))
		{
			playerid = other.object_index;
			image_xscale = other.xscale;
		}
		toomuchalarm1 = 6;
	}
}
if (restartbuffer > 0)
	restartbuffer--;
if ((y > (room_height + 300) || y < -800) && !place_meeting(x, y, obj_verticalhallway) && restartbuffer <= 0 && !verticalhallway && room != custom_lvl_room && state != 89 && state != 186 && !global.levelreset && room != boss_pizzaface && room != tower_outside && room != boss_pizzafacefinale && state != 89 && !instance_exists(obj_backtohub_fadeout) && state != 290)
{
	if (room != Mainmenu && room != tower_outside && room != Realtitlescreen && room != Longintro && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && room != rank_room)
	{
		visible = true;
		with (obj_camera)
		{
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		if (state == 17)
		{
			state = 16;
			sprite_index = spr_ghostidle;
		}
		var s = state;
		notification_push(notifs.fall_outofbounds, [id, s]);
		state = 146;
		visible = false;
		hsp = 0;
		vsp = 0;
		fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, room_height - 100);
		with (instance_create(x, y + 540, obj_technicaldifficulty))
		{
			playerid = other.id;
			if (!other.isgustavo)
				sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3);
			else
				sprite = spr_technicaldifficulty4;
		}
		vsp = 10;
	}
	else
	{
		state = 18;
		x = -100;
		y = -100;
	}
}
if (character == "S")
{
	if (state == 101 || state == 100)
		state = 0;
}
if (character != "M")
{
	if (!scr_solid_player(x, y))
	{
		if (state != 260 && state != 35 && state != 34 && !(state == 106 && sprite_index == spr_tumbleend) && (state != 116 && state != 115) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_player_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != 59 && state != 100 && state != 67 && state != 68 && state != 33 && (state != 72 && sprite_index != spr_player_crouchshoot) && state != 99 && state != 102 && state != 61 && state != 65 && state != 107 && state != 101 && state != 30 && state != 29 && state != 5)
			mask_index = spr_player_mask;
		else
			mask_index = spr_crouchmask;
	}
	else
		mask_index = spr_crouchmask;
}
else
	mask_index = spr_pepperman_mask;
if (state == 46 || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == 90 || state == 61 || state == 112 || state == 7 || state == 98 || state == 95 || state == 89 || state == 186 || state == 152 || state == 146 || (collision_flags & 1) > 0)
	cutscene = true;
else
	cutscene = false;
if ((state == 0 || state == 191) && obj_player1.spotlight == 1 && !instance_exists(obj_uparrow) && (collision_flags & 4) > 0)
{
	if (place_meeting(x, y, obj_uparrowhitbox))
	{
		with (instance_create(x, y, obj_uparrow))
			playerid = other.object_index;
	}
}
if (movespeed > 12 && abs(hsp) > 12 && state == 121 && state != 165 && !instance_exists(speedlineseffectid) && !cutscene && (collision_flags & 1) <= 0)
{
	with (instance_create(x, y, obj_speedlines))
	{
		playerid = other.object_index;
		other.speedlineseffectid = id;
	}
}
with (obj_ratblock)
	scr_ratblock_destroy();
scr_collide_destructibles();
if (state != 290 && state != 17 && state != 186 && state != 208 && state != 18 && state != 150 && state != 4 && state != 112 && state != 97 && state != 7 && state != 95 && state != 118 && state != 90 && state != 98 && state != 39 && state != 64 && state != 46 && state != 89)
	scr_collide_player();
if (state == 150 || state == 186 || state == 208)
{
	x += hsp;
	y += vsp;
}
if (state == 118)
	scr_collide_player();
if (state != 95)
	image_blend = c_white;
prevstate = state;
prevsprite = sprite_index;
