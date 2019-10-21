/// @description  update analog stick

if (device_mouse_check_button(0,mb_left)) { 
    isPressed = true; 
    
    // update GUI mouse coords only if mouse is pressed
    guiMouseX = device_mouse_x_to_gui(0); 
    guiMouseY = device_mouse_y_to_gui(0); 
}
else { 
    isPressed = false; 
}

var xrad = abs(guiMouseX - guiX);
var yrad = abs(guiMouseY - guiY);
// update stick coords
if (isPressed and xrad < radius * 2 and yrad < radius * 2) { 
    if (point_distance(guiX,guiY,guiMouseX,guiMouseY) <= radius*image_xscale) {
        stickX = guiMouseX; 
        stickY = guiMouseY;
    }
    else { // constrain stick to boundary
        var dir = point_direction(guiX,guiY,guiMouseX,guiMouseY); 
        stickX = guiX + lengthdir_x(radius*image_xscale,dir); 
        stickY = guiY + lengthdir_y(radius*image_xscale,dir); 
    }
}
else { 
    // snap back to origin
    if (point_distance(stickX,stickY,guiX,guiY) >= snapRate*image_xscale) {
        var dir = point_direction(stickX,stickY,guiX,guiY); 
        stickX += lengthdir_x(snapRate*image_xscale,dir); 
        stickY += lengthdir_y(snapRate*image_xscale,dir); 
    }
    else { // prevents overshooting
        stickX = guiX; 
        stickY = guiY; 
    }       
}

