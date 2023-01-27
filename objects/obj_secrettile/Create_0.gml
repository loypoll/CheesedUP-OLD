active = false;
alpha = 1;
depth = -7;
desireddepth = -6;
surf = -4;
tiles[0] = array_create(0);
tiles[1] = array_create(0);
tiles[2] = array_create(0);
for (var i = 0; i < 3; i++)
{
	var lay_id = layer_get_id(concat("Tiles_Secret", i + 1));
	tilemap_sprite[i] = -4;
	if (lay_id != -1)
	{
		var map_id = layer_tilemap_get_id(lay_id);
		var ts = tilemap_get_tileset(map_id);
		var t = -4;
		switch (ts)
		{
			case 131:
				t = 3546;
				break;
			case 80:
				t = 2463;
				break;
			case 81:
				t = 2466;
				break;
			case 40:
				t = 2659;
				break;
			case 36:
				t = 2804;
				break;
			case 96:
				t = 2589;
				break;
			case 97:
				t = 2590;
				break;
			case 100:
				t = 2599;
				break;
			case 85:
				t = 2506;
				break;
			case 54:
				t = 2325;
				break;
			case 56:
				t = 2317;
				break;
			case 55:
				t = 2324;
				break;
			case 82:
				t = 2489;
				break;
			case 83:
				t = 2490;
				break;
			case 84:
				t = 2491;
				break;
			case 70:
				t = 2525;
				break;
			case 69:
				t = 2389;
				break;
			case 92:
				t = 2571;
				break;
			case 101:
				t = 2611;
				break;
			case 126:
				t = 3388;
				break;
			case 102:
				t = 2612;
				break;
			case 103:
				t = 2618;
				break;
			case 130:
				t = 2441;
				break;
			case 27:
				t = 3355;
				break;
			case 89:
				t = 2555;
				break;
			case 91:
				t = 2565;
				break;
			case 90:
				t = 2564;
				break;
			case 52:
				t = 2293;
				break;
			case 29:
				t = 2693;
				break;
			case 133:
				t = 3678;
				break;
			case 105:
				t = 2655;
				break;
			case 106:
				t = 2663;
				break;
			case 107:
				t = 2661;
				break;
			case 14:
				t = 1309;
				break;
			case 60:
				t = 2348;
				break;
			case 77:
				t = 2450;
				break;
			case 78:
				t = 2451;
				break;
			case 79:
				t = 2453;
				break;
			case 108:
				t = 2670;
				break;
			case 109:
				t = 2671;
				break;
			case 110:
				t = 2672;
				break;
			case 76:
				t = 2486;
				break;
			case 15:
				t = 227;
				break;
			case 122:
				t = 1865;
				break;
			case 116:
				t = 1144;
				break;
			case 115:
				t = 1173;
				break;
			case 93:
				t = 2585;
				break;
			case 94:
				t = 2586;
				break;
			case 95:
				t = 2587;
				break;
			case 31:
				t = 3964;
				break;
			case 35:
				t = 3887;
				break;
			case 20:
				t = 2399;
				break;
			case 138:
				t = 3184;
				break;
			case 8:
				t = 1462;
				break;
			case 13:
				t = 1016;
				break;
			case 33:
				t = 2420;
				break;
			case 9:
				t = 1604;
				break;
			case 141:
				t = 2613;
				break;
			case 19:
				t = 159;
				break;
			case 129:
				t = 4127;
				break;
			case 143:
				t = 1812;
				break;
			case 5:
				t = 3755;
				break;
			case 11:
				t = 2279;
				break;
			case 4:
				t = 3792;
				break;
			case 18:
				t = 3286;
				break;
			case 28:
				t = 3690;
				break;
			case 119:
				t = 3774;
				break;
			case 117:
				t = 3365;
				break;
			case 137:
				t = 974;
				break;
		}
		tilemap_sprite[i] = t;
		for (var yy = 0; yy < image_yscale; yy++)
		{
			for (var xx = 0; xx < image_xscale; xx++)
			{
				var _x = x + (xx * 32);
				var _y = y + (yy * 32);
				var data = tilemap_get_at_pixel(map_id, _x, _y);
				var _id = tile_get_index(data);
				var xi = 0;
				var yi = 0;
				xi = _id % _w32;
				yi = floor(_id / _w32);
				array_push(tiles[i], [_x, _y, xi * 32, yi * 32]);
				data = tile_set_empty(data);
				tilemap_set_at_pixel(map_id, data, _x, _y);
			}
		}
	}
}
trace(tilemap_sprite);
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
	instance_destroy();
