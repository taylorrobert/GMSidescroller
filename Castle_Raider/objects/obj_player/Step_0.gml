/// @description  axis controls

if (instance_exists(obj_analog_stick)) {
    // magnitude, ranging from -1 to 1
    var mag = scr_get_analog_stick_axis(obj_analog_stick,axis.X); 
    
    // flip sprite 
    if (mag < 0) { 
        image_xscale = -1; 
    }
    else if (mag > 0) { 
        image_xscale = 1; 
    }
    
    // multiply rate (8 px) by mag percentage, then add to x
    x += mag*rate; 
}
else { 
    // accelerometer controls
    
    // vars 
    var xvector = rate; 
    var tiltDeadZone = 0.17; // range of 0 to 1; when on table, value fluctuates around 0.04
    var speedFactor = 1/0.45; //0.45 means phone is tilted about 42 degrees
    
    // magnitude, ranging from -1 to 1
    var mag = scr_get_tilt_speed(xvector,speedFactor,tiltDeadZone); 
    
    // flip sprite 
    if (mag < 0) { 
        image_xscale = -1; 
    }
    else if (mag > 0) { 
        image_xscale = 1; 
    }
    
    // multiply rate (8 px) by mag percentage, then add to x
    x += mag;
} 

/// keyboard movement (triggered by virtual keys)

if (keyboard_check(vk_left)) { 
    if (place_free(x-rate,y)) { 
        x -= rate; 
    }
    image_xscale = -1;
}
if (keyboard_check(vk_right)) { 
    if (place_free(x+rate,y)) { 
        x += rate; 
    }
    image_xscale = 1; 
}
if (keyboard_check(vk_up)) { 
    if (place_free(x,y-rate)) { 
        y -= rate; 
    }
}
if (keyboard_check(vk_down)) { 
    if (place_free(x,y+rate)) { 
        y += rate; 
    }
}

// limit to room constraints 
if (x < 0) { 
    x = 0; 
}
if (x+sprite_width/2 > room_width) { 
    x = room_width-sprite_width/2; 
}
if (y < 0) { 
    y = 0; 
}
if (y+sprite_height/2 > room_height) { 
    y = room_height-sprite_height/2; 
}

