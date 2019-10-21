/// @description  initialize virtual keys 

// localvars
var width = sprite_get_width(spr_dpad); 
var height = sprite_get_height(spr_dpad); 

//dpad coordinates
dpad_x = x * display_get_gui_width()/__view_get( e__VW.WView, 0 ); 
dpad_y = y * display_get_gui_height()/__view_get( e__VW.HView, 0 ); 

margin = 128; // add a margin of error area around each key to accomodate the player's finger leaving the sprite bounding box

var xx = dpad_x - margin; 
var yy = dpad_y - margin; 

// the vkeys are made by segmenting the dpad sprite into thirds horizontally and vertically - this allows for eight directions
global.vkey_left = virtual_key_add(xx,yy,width/3+margin,height+2*margin,vk_left); 
//global.vkey_up = virtual_key_add(xx,yy,width+2*margin,height/3+margin,vk_up); 
global.vkey_right = virtual_key_add(xx+margin+(width/3)*2,yy,width/3+margin,height+2*margin,vk_right); 
//global.vkey_down = virtual_key_add(xx,yy+margin+(height/3)*2,width+2*margin,height/3+margin,vk_down); 

// show virtual keys (for debug)
//virtual_key_show(global.vkey_left); 
//virtual_key_show(global.vkey_up); 
//virtual_key_show(global.vkey_right); 
//virtual_key_show(global.vkey_down); 



