/// @arg tilex
/// @arg tiley
/// @arg tilesize
/// @arg debug
var tilex = argument0;
var tiley = argument1;
var tilesize = argument2;
var debug = argument3;

tilex = (tilex div tilesize) * tilesize;
tiley = (tiley div tilesize) * tilesize;

var lay_id = layer_get_id("Collisions");
var map_id = layer_tilemap_get_id(lay_id);

var map;

var topleft = -999;
var topmid = -999;
var topright = -999;

var midleft = -999;
var center = -999;
var midright = -999;

var botleft = -999;
var botmid = -999;
var botright = -999;

	
map[0,0] = topleft = tilemap_get_at_pixel(map_id, tilex - tilesize, tiley - tilesize);
map[0,1] = topmid = tilemap_get_at_pixel(map_id, tilex, tiley - tilesize);
map[0,2] = topright = tilemap_get_at_pixel(map_id, tilex + tilesize, tiley - tilesize);
								
map[1,0] = midleft = tilemap_get_at_pixel(map_id, tilex - tilesize, tiley);
map[1,1] = center = tilemap_get_at_pixel(map_id, tilex, tiley);
map[1,2] = midright = tilemap_get_at_pixel(map_id, tilex + tilesize, tiley);
								
map[2,0] = botleft = tilemap_get_at_pixel(map_id, tilex - tilesize, tiley + tilesize);
map[2,1] = botmid = tilemap_get_at_pixel(map_id, tilex, tiley + tilesize);
map[2,2] = botright = tilemap_get_at_pixel(map_id, tilex - tilesize, tiley + tilesize);


if (botmid == SOLID and midright == SOLID
	and topmid != SOLID and midleft != SOLID) return G_9SLICE_TOPLEFT;
	
if (midleft == SOLID and midright == SOLID
	and topmid != SOLID) return G_9SLICE_TOPMID;
	
if (botmid == SOLID and midleft == SOLID
	and topmid != SOLID and midright != SOLID) return G_9SLICE_TOPRIGHT;

if (topmid == SOLID and botmid == SOLID
	and midleft != SOLID) return G_9SLICE_MIDLEFT;

if (topmid == SOLID and midright == SOLID and midleft == SOLID and botmid == SOLID) return G_9SLICE_CENTER;

if (topmid == SOLID and botmid == SOLID
	and midright != SOLID) return G_9SLICE_MIDRIGHT;

if (topmid == SOLID and midright == SOLID
	and midleft != SOLID and botmid != SOLID) return G_9SLICE_BOTTOMLEFT;

if (midleft == SOLID and midright == SOLID
	and botmid != SOLID) return G_9SLICE_BOTTOMMID;
	
if (topmid == SOLID and midleft == SOLID
	and botmid != SOLID and midright != SOLID) return G_9SLICE_BOTTOMRIGHT;


if (debug) {
	var out = "";
	for (var i = 0; i < 3; i++) {
		var row = "";
		for (var j = 0; j < 3; j++) {			
			row += string(map[i,j]) + ", ";
		}
		
		//text
		var xx = 10;
		var yy = 11;
		draw_set_font(fnt_stats);
		draw_set_halign(fa_right);
		
		var text_xx = 54;
		var text_yy = 14;
		//draw shadow
		draw_set_color(c_black);
		draw_text(xx + text_xx + 1, yy + text_yy + 1, row);
		//draw text
		draw_set_color(c_white);
		draw_text(xx + text_xx, yy + text_yy, row);
		
		out += row + "#";		
	}
	
	show_message( string_hash_to_newline(out));
	
}
	
	
	


