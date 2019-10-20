//Check to see if window has been resized. If so, resize viewport

//Setting pre-defined screen resolution settings

view_hport[0] = window_get_height();
view_wport[0] = window_get_width();


//Checking surface against viewport
if (view_wport[0] != surface_get_width(application_surface)) || (view_hport[0] != surface_get_height(application_surface)) {
    //Setting surface to match viewport settings (updates NEXT draw frame)
   surface_resize(application_surface, view_wport[0],view_hport[0]);
}