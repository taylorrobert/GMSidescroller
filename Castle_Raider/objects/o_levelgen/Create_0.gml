
generated_tile_size = 16;
tile_group_size = 48;
side_buffer = 5;
turn_chance = 50;
total_area = 200;

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {		
		instance_create_layer(i * generated_tile_size, j * generated_tile_size, "Structure", o_wall);
	}
}


var dir = 0;
var carved = 0;

while (carved < total_area) {
	if (chance(turn_chance)) {		
		dir = choose(0, 1, 2, 3) * 90;
	}
	
	var object = instance_place(x, y, o_wall);
	
	if (object) {
		
		for (var i = 0; i < tile_group_size; i += generated_tile_size) {
			//if (random(100) < 5)				continue;
			for (var j = 0; j < tile_group_size; j += generated_tile_size) {
				//if (random(100) < 5) continue;
				instance_destroy(instance_place(x + generated_tile_size * (i div generated_tile_size), y + generated_tile_size * (j div generated_tile_size), o_wall));	
			}
		}
		carved++;	
	} 
	
	
	x += lengthdir_x(tile_group_size, dir);
	y += lengthdir_y(tile_group_size, dir);
	
	x = clamp(x, 0 + generated_tile_size * side_buffer, room_width - generated_tile_size * side_buffer);
	y = clamp(y, 0 + generated_tile_size * side_buffer, room_height - generated_tile_size * side_buffer);
	
	
}

for (i = 0; i < room_width div generated_tile_size; i++) {
	for (var j = 0; j < room_height div generated_tile_size; j++) {
		var object = instance_place(i * generated_tile_size, j * generated_tile_size, o_wall);
		if (object != noone) {
				
			//draw collision layer
			var lay_id = layer_get_id("Collisions");
			var map_id = layer_tilemap_get_id(lay_id);
			var data = tilemap_get(map_id, 0, 0);
			tilemap_set(map_id, SOLID, i, j);
			
			////draw basic tile layer			
			//lay_id = layer_get_id("TileMid");
			//map_id = layer_tilemap_get_id(lay_id);
			//data = tilemap_get(map_id, 0, 0);			
			//tilemap_set(map_id, 22, i, j);		
			
		}		
	}
}


//fix into 9 slices
var sequenceCounts;
for (i = 0; i < room_width; i += generated_tile_size) {

	
	for (var j = 0; j < room_height; j += generated_tile_size) {	
		
		var object = instance_place(i, j, o_wall);
		if (object != noone) {
			lay_id = layer_get_id("NineSliceTest");
			map_id = layer_tilemap_get_id(lay_id);
		
			var nine = get9Slice(i, j, generated_tile_size, false)
			
			//var prevX = i = 1;
			//var prevY = j - 1;
			
			//var currentCellArray;
			//currentCellArray[0] = nine;
			//currentCellArray[1] = 
			
			//sequenceCounts[i,j] = nine;
			
			//var xSequenceCount, ySequenceCount = 0;
			
			//if (prevX < 0) xSequenceCount = 0;
			//if (prevY < 0) YSequenceCount = 0;
			
			
			
			
			var tileId = tilesetMap_forest_cave(nine, 0);
			
			if (nine > -1) tilemap_set(map_id, tileId, i div generated_tile_size, j div generated_tile_size);		
			instance_destroy(instance_place(i, j, o_wall));	
		}
		
		
	}
}


//go through in 4x4 squares and place platforms to get up and down if there are no vertical surfaces


//map 
