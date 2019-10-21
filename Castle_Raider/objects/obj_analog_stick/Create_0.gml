/// @description  Important stuff about making the analog stick work properly!

/* 
    The stick is drawn to the GUI layer - that is, its pixels aren't scaled up with the game view. 
    It is drawn DIRECTLY to the screen. This means that if you have (on Windows Phone, for instance) a 400x200 game that 
    is scaled up to a 1280x720 resolution, the analog stick will be drawn as if the game wasn't scaled. (If the stick 
    was positioned at (380,180), the lower-left of a 400x200 screen, it would appear to be in the upper right of a 
    1280x720 screen.)
    So be mindful of how the coordinates at which you place the analog stick in the room editor may not necessarily 
    reflect the coordinates to which it is drawn during run time!  
    
    Currently there's code in the stick's create event to take care of this issue (it's as simple as multiplying its room
    coordinates by the ratio of the screen width to the view width), but it's a good thing to be aware of. 
    HOWEVER, make sure your room has at least one view, even if your game doesn't need it! 
    (Using the variables view_wview and view_hview when views aren't actually enabled doesn't seem to work. 
    To work around this, just make a view with the dimensions of your room. Thanks!)
*/
        
        

/* */
/// initialize enums for axes

// originally these were stored as AXIS_X and AXIS_Y 
// as macros/constants, but the marketplace currently 
// doesn't support those. 

enum axis { 
    X,
    Y
}; 

/* */
/// initialize stick

boundSprite = sprite_index; // should be spr_analog_boundary 
stickSprite = spr_analog_stick; 

radius = sprite_get_width(boundSprite)/2; 
alpha = 0.75; 
snapRate = 24; // speed at which stick snapes back to origin

// as a note, image_xscale and image_yscale should be used for referencing scale.

// stick OBJECT won't actually move with view - only sprite will. 
guiX = x * display_get_gui_width()/__view_get( e__VW.WView, 0 ); // multiplying by the gui to room ratio accounts for any view scaling issues
guiY = y * display_get_gui_height()/__view_get( e__VW.HView, 0 );

// using GUI mouse coordinates is easier than offsetting the room
guiMouseX = device_mouse_x_to_gui(0); 
guiMouseY = device_mouse_y_to_gui(0); 

stickX = guiX; 
stickY = guiY; 

// boolean
isPressed = false; 


/* */
/*  */
