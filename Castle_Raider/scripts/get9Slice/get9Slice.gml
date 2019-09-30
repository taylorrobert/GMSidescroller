/// @arg tilex
/// @arg tiley
/// @arg tilesize
/// @arg debug
var tilex = argument0;
var tiley = argument1;
var tilesize = argument2;
var debug = argument3;

//tilex = (tilex div tilesize) * tilesize;
//tiley = (tiley div tilesize) * tilesize;

var lay_id = layer_get_id("Collisions");
var map_id = layer_tilemap_get_id(lay_id);

var map;



	
map[0,0] =  tilemap_get_at_pixel(map_id, tilex - tilesize, tiley - tilesize);
map[0,1] = tilemap_get_at_pixel(map_id, tilex, tiley - tilesize);
map[0,2] = tilemap_get_at_pixel(map_id, tilex + tilesize, tiley - tilesize);
						
map[1,0] =  tilemap_get_at_pixel(map_id, tilex - tilesize, tiley);
map[1,1] = tilemap_get_at_pixel(map_id, tilex, tiley);
map[1,2] = tilemap_get_at_pixel(map_id, tilex + tilesize, tiley);
						
map[2,0] =  tilemap_get_at_pixel(map_id, tilex - tilesize, tiley + tilesize);
map[2,1] = tilemap_get_at_pixel(map_id, tilex, tiley + tilesize);
map[2,2] = tilemap_get_at_pixel(map_id, tilex + tilesize, tiley + tilesize);


var topleft		= map[0,0];
var topmid		= map[0,1];
var topright	= map[0,2];

var midleft		= map[1,0];
var center		= map[1,1];
var midright	= map[1,2];

var botleft		= map[2,0];
var botmid		= map[2,1];
var botright	= map[2,2];


var slice = G_9SLICE_UNKNOWN;

if (botmid == SOLID and midright == SOLID
	and topmid != SOLID and midleft != SOLID) 
		slice = G_9SLICE_TOPLEFT;
	
else if (midleft == SOLID and midright == SOLID
	and topmid != SOLID) 
		slice = G_9SLICE_TOPMID;
	
else if (botmid == SOLID and midleft == SOLID
	and topmid != SOLID and midright != SOLID)  
		slice = G_9SLICE_TOPRIGHT;

else if (topmid == SOLID and botmid == SOLID
	and midleft != SOLID)  
		slice = G_9SLICE_MIDLEFT;

else if (topmid == SOLID and midright == SOLID and midleft == SOLID and botmid == SOLID)  
		slice = G_9SLICE_CENTER;

else if (topmid == SOLID and botmid == SOLID
	and midright != SOLID) 
		slice = G_9SLICE_MIDRIGHT;

else if (topmid == SOLID and midright == SOLID
	and midleft != SOLID and botmid != SOLID)  
		slice = G_9SLICE_BOTTOMLEFT;

else if (midleft == SOLID and midright == SOLID
	and botmid != SOLID)  
		slice = G_9SLICE_BOTTOMMID;
	
else if (topmid == SOLID and midleft == SOLID
	and botmid != SOLID and midright != SOLID)  
		slice = G_9SLICE_BOTTOMRIGHT;


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

return slice;
	
	
	


