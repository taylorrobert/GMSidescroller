/// @description Insert description here
// You can write your code in this editor

//tiles
//get tilemap
global.map = layer_tilemap_get_id("Collisions");
global.tile_size = 16;

//player create

if (room == rm_generated) {
	if (layer_get_id("Player")) instance_create_layer(o_levelgen.x, o_levelgen.y, "Player", o_player);	
	if (layer_get_id("PlayerGun")) instance_create_layer(o_levelgen.x, o_levelgen.y, "PlayerGun", o_gun);	
}