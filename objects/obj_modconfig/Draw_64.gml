if live_call() return live_result;

// temp bg
draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
draw_set_alpha(1);

// options left side
draw_set_colour(c_white);
draw_set_align();

var yy = 60;
for(var i = 0; i < array_length(options_array); i++)
{
	var opt = options_array[i];
	
	switch opt.type
	{
		case 0: // normal
			draw_set_font(global.font_small);
			if sel == i
			{
				draw_set_alpha(1);
				draw_sprite(spr_cursor, -1, 40, yy + 8);
			}
			else
				draw_set_alpha(0.5);
			draw_text(80, yy, opt.name);
			
			// value
			draw_text(350, yy, opt.opts[opt.value][0]);
			
			yy += 18;
			break;
		
		case 1: // SECTION
			draw_set_alpha(1);
			draw_set_font(global.creditsfont);
			
			yy += 30;
			draw_text(60, yy, options_array[i].name);
			yy += 40;
			break;
	}
}

// current option
var opt = options_array[sel];

draw_set_font(global.bigfont);
draw_set_align(fa_center);
draw_set_alpha(1);
draw_text(690, 80, string_upper(opt.name));

draw_set_font(global.font_small);
draw_text_ext(690, 420, opt.desc, 16, 450);

draw_set_font(global.smallfont);
draw_text(690, 116, opt.opts[opt.value][0]);

if is_callable(opt.drawfunc)
{
	// roundrect background
	var xx = 690, wd = 960 / 2.5;
	var yy = 260, ht = 540 / 2.5;
	
	if !surface_exists(surf)
		surf = surface_create(wd, ht);
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	opt.drawfunc(opt.value);
	
	draw_set_colour(c_white);
	draw_roundrect(0, 0, wd - 2, ht - 2, true);
	
	surface_reset_target();
	draw_surface(surf, xx - wd / 2, yy - ht / 2);
}
