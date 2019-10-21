/// @description  scr_get_analog_stick_axis(obj,axis)
/// @param obj
/// @param axis
/// get a value between 1 and -1 for either the x or y axis. 

var stick = argument0; // should be ID of obj_analog_stick instance
var axis = argument1; // should be 1 of 2 constants: AXIS_X or AXIS_Y

var value = 0; 
// yields 0 - 360
var dir = point_direction(stick.guiX,stick.guiY,stick.stickX,stick.stickY); 
// yields decimal from 0 - 1
var mag = point_distance(stick.guiX,stick.guiY,stick.stickX,stick.stickY)/(stick.radius*stick.image_xscale); 

if (axis == axis.X) { 
    value = lengthdir_x(mag,dir); 
}
else {
    value = lengthdir_y(mag,dir); 
} 

return value; 
