
if (normal) {
	camera_set_view_size(camera, normalWidth, normalHeight)	
}
else {
	camera_set_view_size(camera, bigWidth, bigHeight);	
}

view_set_camera(0, camera);
normal = !normal;