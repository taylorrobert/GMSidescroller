//init
hsp = 0;
vsp = 0;
hsp_decimal = 0;
vsp_decimal = 0;
spd = 4;
facing = -1;
image_speed = 0;

//destroy object
die = false;

//change object's layer after a set time
alarm[LAYER_CHANGE] = room_speed / 7;