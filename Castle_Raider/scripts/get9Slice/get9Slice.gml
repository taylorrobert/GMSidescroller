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

//none
if (!isSolid(topleft) and !isSolid(topmid) and !isSolid(topright)
	and !isSolid(midleft) and !isSolid(center) and !isSolid(midright)
	and !isSolid(botright) and !isSolid(botmid) and !isSolid(botright))
	slice = G_9SLICE_NONE

//structural
else if (isSolid(botmid) and isSolid(midright)
	and !isSolid(topmid) and !isSolid(midleft)) 
		slice = G_9SLICE_TOPLEFT;
	
else if (isSolid(midleft) and isSolid(midright)
	and !isSolid(topmid)
	and isSolid(botmid)) 
		slice = G_9SLICE_TOPMID;
	
else if (isSolid(botmid) and isSolid(midleft)
	and !isSolid(topmid) and !isSolid(midright))  
		slice = G_9SLICE_TOPRIGHT;

else if (isSolid(topmid) and isSolid(botmid)
	and !isSolid(midleft))  
		slice = G_9SLICE_MIDLEFT;

else if (isSolid(topmid) and isSolid(botmid)
	and !isSolid(midright)) 
		slice = G_9SLICE_MIDRIGHT;

else if (isSolid(topmid) and isSolid(midright)
	and !isSolid(midleft) and !isSolid(botmid))  
		slice = G_9SLICE_BOTTOMLEFT;

else if (isSolid(midleft) and isSolid(midright)
	and !isSolid(botmid)
	and isSolid(topmid))  
		slice = G_9SLICE_BOTTOMMID;
	
else if (isSolid(topmid) and isSolid(midleft)
	and !isSolid(botmid) and !isSolid(midright))  
		slice = G_9SLICE_BOTTOMRIGHT;
		
//Inside corners
else if (isSolid(topmid) and isSolid(midleft) and isSolid(botmid) and isSolid(midright)
	and !isSolid(topright))
		slice = G_9SLICE_INSIDE_BOTTOMLEFT
		
else if (isSolid(topmid) and isSolid(midleft) and isSolid(botmid) and isSolid(midright)
	and !isSolid(topleft))
		slice = G_9SLICE_INSIDE_BOTTOMRIGHT
		
else if (isSolid(topmid) and isSolid(midleft) and isSolid(botmid) and isSolid(midright)
	and !isSolid(botleft))
		slice = G_9SLICE_INSIDE_TOPRIGHT
	
else if (isSolid(topmid) and isSolid(midleft) and isSolid(botmid) and isSolid(midright)
	and !isSolid(botright))
		slice = G_9SLICE_INSIDE_TOPLEFT
		
//Hangers
else if (!isSolid(botright) and !isSolid(botleft) and !isSolid(midright) and !isSolid(midleft)
		and isSolid(center) and isSolid(topmid))
		slice = G_9SLICE_TOPHANGER
		
else if (!isSolid(topright) and !isSolid(topleft) and !isSolid(midright) and !isSolid(midleft)
		and isSolid(center) and isSolid(botmid))
		slice = G_9SLICE_BOTTOMUPJUT

//Platform
else if (!isSolid(topleft) and !isSolid(topmid) and !isSolid(topright)
		and isSolid(midleft) and isSolid(center) and isSolid(midright)
		and !isSolid(botleft) and !isSolid(botmid) and !isSolid(botright))
		slice = G_PLATFORM_MID
		
else if (!isSolid(topleft) and !isSolid(topmid) and !isSolid(topright)
		and isSolid(midleft) and isSolid(center) and !isSolid(midright)
		and !isSolid(botleft) and !isSolid(botmid) and !isSolid(botright))
		slice = G_PLATFORM_RIGHT
		
else if (!isSolid(topleft) and !isSolid(topmid) and !isSolid(topright)
		and !isSolid(midleft) and isSolid(center) and isSolid(midright)
		and !isSolid(botleft) and !isSolid(botmid) and !isSolid(botright))
		slice = G_PLATFORM_LEFT
		
else if (isSolid(midright)
		and !isSolid(topright) and !isSolid(botright))
		slice = G_PLATFORM_WALLRIGHT
		
else if (isSolid(midleft)
		and !isSolid(topleft) and !isSolid(botleft))
		slice = G_PLATFORM_WALLLEFT

else if (!isSolid(topmid) and !isSolid(midleft) and isSolid(center) and !isSolid(midright)	and !isSolid(botmid))
		slice = G_9SLICE_SINGLEISLAND


//center
else if (isSolid(topmid) and isSolid(midright) and isSolid(midleft) and isSolid(botmid))  
	slice = G_9SLICE_CENTER;
	
else 
	slice = G_9SLICE_UNKNOWN;

	


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
	
	
	


