if live_call() return live_result;

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
			
			yy += 20;
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
draw_set_font(global.bigfont);
draw_set_align(fa_center);
draw_set_alpha(1);
draw_text(680, 80, string_upper(options_array[sel].name));

draw_set_font(global.font_small);
draw_text_ext(680, 420, options_array[sel].desc, 16, 450);
