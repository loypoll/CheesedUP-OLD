if live_call() return live_result;

// prep
depth = -600;
image_speed = 0.35;
scr_init_input();
stickpressed = false;
con = 0;
t = 0;

options_array = [];
function add_option(name, variable, desc = "", drawfunc = noone)
{
	var struct = {
		type: 0,
		value: 0,
		vari: variable,
		name: name,
		desc: desc,
		opts: [["OFF", false], ["ON", true]],
		drawfunc: drawfunc
	}
	array_push(options_array, struct);
	return struct;
}
function add_section(name)
{
	var struct = {
		type: 1,
		value: 0,
		name: name
	};
	array_push(options_array, struct);
	return struct;
}
sel = 1;
section = -1;
surf = noone;

// simuplayer
reset_simuplayer = function()
{
	simuplayer = {
		x: 960 / 2.5 / 2, y: 540 / 2.5 / 1.5, state: states.normal, hsp: 0, vsp: 0, sprite: spr_player_idle, image: 0, xscale: 1, timer: 0, move: 0, changed: false
	}
}
function draw_simuplayer()
{
	var p = simuplayer;
	
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, 0);
	
	var width = 960 / 2.5;
	
	if p.x < 50
		draw_sprite_ext(p.sprite, p.image, p.x + width, p.y, p.xscale, 1, 0, c_white, 1);
	if p.x > width - 50
		draw_sprite_ext(p.sprite, p.image, p.x - width, p.y, p.xscale, 1, 0, c_white, 1);
	
	draw_sprite_ext(p.sprite, p.image, p.x, p.y, p.xscale, 1, 0, c_white, 1);
	shader_reset();
}
reset_simuplayer();

// options
add_section("Gameplay");

#region REMIX

color1 = shader_get_uniform(shd_mach3effect, "color1");
color2 = shader_get_uniform(shd_mach3effect, "color2");
var opt = add_option("Remix", "gameplay", "Adds extra quality of life improvements to a bunch of stuff.", function(val)
{
	draw_sprite_ext(val == 1 ? spr_tv_bgfinal_NEW : spr_tv_bgfinal, 1, 110, 70, 1, 1, 0, c_white, 1);
	
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, 0);
	draw_sprite_ext(spr_tv_idle, 0, 110, 70, 1, 1, 0, c_white, 1);
	shader_reset();
	
	if val == 1
	{
		shader_set(shd_mach3effect);
		gpu_set_blendmode(bm_normal);
		
		var b = global.mach_color1;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 0, 240, 150);
		draw_sprite(spr_player_mach, 2, 340, 150);
		
		b = global.mach_color2;
		shader_set_uniform_f(color1, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		b = merge_colour(b, c_black, 0.9);
		shader_set_uniform_f(color2, color_get_red(b) / 255, color_get_green(b) / 255, color_get_blue(b) / 255);
		
		draw_sprite(spr_player_mach, 1, 290, 150);
		shader_reset();
	}
	else
	{
		draw_sprite_ext(spr_player_mach, 0, 240, 150, 1, 1, 0, global.mach_color1, 1);
		draw_sprite_ext(spr_player_mach, 1, 290, 150, 1, 1, 0, global.mach_color2, 1);
		draw_sprite_ext(spr_player_mach, 2, 340, 150, 1, 1, 0, global.mach_color1, 1);
	}
});
opt.value = global.gameplay;

#endregion
#region ATTACK STYLE

var opt = add_option("Attack Style", "attackstyle", "Alternatives to the basic grab move. The original grab is moved to the CHAINSAW button.", function(val)
{
	var p = simuplayer;
	
	if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
	{
		p.state = states.panicjump;
		p.move = 0;
		p.timer = -100;
	}
	else if p.changed && p.x != 75
	{
		if p.state == states.titlescreen
			p.state = states.normal;
		if p.state == states.normal
		{
			if p.x > 75 && p.x + p.hsp > 75
				p.move = -1;
			else if p.x < 75 && p.x + p.hsp < 75
				p.move = 1;
			else
			{
				p.x = 75;
				p.hsp = 0;
				p.move = 0;
				p.xscale = 1;
				p.timer = 10;
				p.changed = false;
			}
		}
	}
	else
	{
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 75;
			p.xscale = 1;
		}
		
		p.timer++;
		if p.timer >= 30
		{
			if val == 0
			{
				p.timer = -40;
				//sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_suplexdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
			if val == 1
			{
				p.timer = -5;
				sound_play_centered_oneshot("event:/sfx/pto/kungfu");
				
				p.state = states.punch;
				p.sprite = choose(spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3);
				p.image = 0;
				
				if p.x > 960 / 2.5 / 2
					p.xscale = -1;
				else
					p.xscale = 1;
				
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
			if val == 2
			{
				p.timer = -30;
				sound_play_centered_oneshot(sfx_dive);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_attackdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 6 * p.move;
			}
		}
	}
	
	draw_simuplayer();
});
opt.value = global.attackstyle;
opt.opts = [
	["GRAB", 0],
	["KUNG FU", 1],
	["SHOULDER BASH", 2]
];

#endregion
#region SHOOT STYLE

var opt = add_option("Special Attack", "shootstyle", "Extra attacks bound to the SHOOT button.", function(val)
{
	var p = simuplayer;
	
	if p.state == states.titlescreen
	{
		p.xscale = 1;
		p.state = states.normal;
		p.sprite = spr_player_idle;
		p.move = 0;
		p.hsp = 0;
		bullets = 3;
		p.timer = 0;
	}
	else if p.x != 100
		p.x = Approach(p.x, 100, 10);
	else
	{
		if p.changed
		{
			p.changed = false;
			p.state = states.titlescreen;
		}
		
		p.timer++;
		if p.timer > 20
		{
			p.timer = 0;
			if val == 1 && floor(bullets) > 0 && frac(bullets) == 0
			{
				sound_play_centered_oneshot(sfx_pistolshot);
				p.state = states.pistol;
				p.sprite = spr_player_pistolshot;
				p.image = 0;
				bullets--;
			}
		}
		
		if p.state != states.pistol
		{
			if bullets == 0
				p.timer = -80;
			bullets = Approach(bullets, 3, 0.05);
		}
	}
	
	draw_simuplayer();
	
	if val == 1
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_peppinobullet_collectible, -1, 136 - 46 * i, -32);
	}
	if val == 2
	{
		p.state = -1;
		p.sprite = spr_player_taunt;
		p.image = 10;
		
		draw_set_font(global.creditsfont);
		draw_text(960 / 2.5 / 2, 60, "Unimplemented!");
	}
});
opt.opts = [
	["NONE", 0],
	["PISTOL", 1],
	["BREAKDANCE", 2]
];
opt.value = global.shootstyle;

#endregion
#region DOUBLE GRAB

var opt = add_option("Grab Special", "doublegrab", "Press the GRAB button twice to attack.", function(val)
{
	var p = simuplayer;
	
	if p.sprite == spr_player_breakdanceuppercut && p.state == states.titlescreen
	{
		p.state = states.panicjump;
		p.move = 0;
		p.timer = -100;
	}
	else if p.changed
	{
		bullets = 3;
		if p.state == states.titlescreen
			p.state = states.normal;
		if p.state == states.normal
		{
			if p.x > 75 && p.x + p.hsp > 75
				p.move = -1;
			else if p.x < 75 && p.x + p.hsp < 75
				p.move = 1;
			else
			{
				p.x = 75;
				p.hsp = 0;
				p.move = 0;
				p.xscale = 1;
				p.timer = 10;
				p.changed = false;
			}
		}
	}
	else
	{
		if p.state == states.titlescreen
		{
			p.state = states.normal;
			p.sprite = spr_player_idle;
			p.x = 75;
			p.xscale = 1;
		}
		
		p.timer++;
		if p.timer >= 30 && val != 0 && (val != 3 or floor(bullets) > 0)
		{
			if p.state == states.handstandjump
			{
				p.timer = -30;
				if val == 1
				{
					sound_play_centered_oneshot(sfx_dive);
					p.sprite = spr_player_attackdash;
					p.image = 0;
				}
				if val == 2
				{
					p.sprite = spr_player_faceplant;
					p.state = states.faceplant;
					p.hsp = 8;
					p.image = 0;
				}
				if val == 3
				{
					p.sprite = spr_player_chainsawdash;
					p.state = states.chainsawbump;
					p.hsp = 11;
					p.image = 0;
					bullets--;
				}
			}
			else
			{
				p.timer = 10;
				//sound_play_centered_oneshot(sfx_suplexdash);
				
				p.state = states.handstandjump;
				p.sprite = spr_player_suplexdash;
				p.image = 0;
				p.move = p.xscale;
				p.hsp = 4 * p.move;
			}
		}
	}
	
	if val == 3
	{
		for(var i = 0; i < floor(bullets); i++)
			draw_sprite(spr_fuelHUD, -1, 136 - 46 * i, 46);
	}
	
	draw_simuplayer();
});
opt.opts = [
	["NONE", 0],
	["SHOULDER BASH", 1],
	["FACEPLANT", 2],
	["CHAINSAW", 3]
];
opt.value = global.doublegrab;

#endregion
#region BUFFED UPPERCUT

var opt = add_option("Buffed Uppercut", "uppercut", "Keeps your momentum when uppercutting, and you can press down to fall down faster.", function(val)
{
	var p = simuplayer;
	if p.state == states.titlescreen
	{
		p.timer = 0;
		p.state = states.normal;
	}
	p.move = 1;
	
	p.timer++;
	if p.timer >= 20
	{
		p.timer = -50;
		sound_play_centered_oneshot(sfx_uppercut);
			
		p.state = states.panicjump;
		p.sprite = spr_player_breakdanceuppercut;
		if val != 1
			p.hsp = 2;
		p.vsp = -12;
		p.image = 0;
	}
	
	draw_simuplayer();
});
opt.value = global.uppercut;

#endregion
#region HEAT METER

var opt = add_option("Heat Meter", "heatmeter", "Rewards good gameplay with more points, but harder enemies!", function(val)
{
	var xx = 960 / 2.5 / 2, yy = 540 / 2.5 / 2;
	
	if val
	{
		draw_sprite(spr_heatmeter, 0, xx, yy);
		draw_sprite(spr_pizzascore, 0, xx, yy);
	}
	else
		draw_sprite(spr_pizzascore, 0, xx, yy);
});
opt.value = global.heatmeter;

#endregion
#region SHOOT BUTTON

var opt = add_option("Separate Shoot", "shootbutton", "Move the shoot button for both the pistol and the shotgun to a standalone SHOOT button, A by default.", function(val)
{
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_peppalette, 1, false);
	
	if val == 0
	{
		var cx = 180, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_shotgun, 0, 200, 130);
	}
	else if val == 1
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
	
		draw_sprite(spr_player_suplexdash, 5, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 260, 130);
	}
	else if val == 2
	{
		var cx = 80, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_shoot), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_shotgun, 0, 100, 130);
		
		var cx = 260, cy = 50;
		draw_sprite(spr_tutorialkey, 0, cx, cy);
		draw_set_align(1, 1);
		draw_set_font(global.tutorialfont);
		draw_text_color(cx + 16, cy + 14, chr(global.key_slap), c_black, c_black, c_black, c_black, 1);
		draw_set_align();
		
		draw_sprite(spr_player_pistolshot, 1, 280, 130);
	}
	
	shader_reset();
});
opt.opts = [
	["OFF", false],
	["ON", true],
	["SHOTGUN ONLY", 2]
]
opt.value = global.shootbutton;

#endregion

add_section("Visual");
#region PANIC BG

var opt = add_option("Panic Background", "panicbg", "Brings back the wavy background effect from old builds when escaping.", function(val)
{
	if val
	{
		shader_set(shd_panicbg);
		
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "panic"), 1);
		shader_set_uniform_f(shader_get_uniform(shd_panicbg, "time"), current_time / 1000);
		
		draw_sprite_ext(bg_desert, -1, 0, 0, 0.4, 0.4, 0, c_white, 1);
		
		shader_reset();
	}
	else
		draw_sprite_ext(bg_desert, -1, 0, 0, 0.4, 0.4, 0, c_white, 1);
});
opt.value = global.panicbg;

#endregion
