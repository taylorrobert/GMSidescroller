/// @description  scr_get_tilt_speed(xvector,speed_factor,dead_zone)
/// @param xvector
/// @param speed_factor
/// @param dead_zone
/// yields tilt speed for ON-SCREEN x axis (for some reason this is the phone's y axis)
/// utilizes device ACCELEROMETER. 

// The x axis corresponds to side-to-side movement. (Tilting the phone like a steering wheel.)
var speed_factor = argument1; 
var dead_zone = argument2; 
var xspeed = device_get_tilt_y() * argument0 * speed_factor; 
// speed factor is used so that full speed can be achieved without titling phone at 90 degree angle

if (abs(xspeed) > dead_zone*argument0*speed_factor) { 
    if (display_get_orientation() == display_landscape) {
        xspeed *= -1; //flip it  
    }
    else if (display_get_orientation() == display_landscape_flipped) {
        xspeed *= 1; //for consistency's sake; remove later?
    }
}
 
return xspeed; // used to derive input (e.g. moving left vs. right)

