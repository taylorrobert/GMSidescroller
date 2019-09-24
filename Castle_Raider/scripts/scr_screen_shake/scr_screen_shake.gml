/// @descr scr_screen_shake(seconds, shake_amount);
/// @arg seconds_to_shake
/// @arg shake_amount_-1def

var time = argument0;
var amount = argument1;

with(o_camera) {
	//default
	if (amount == -1) amount = screen_shake_amount_initial;
	screen_shake = true;
	alarm[SCREEN_SHAKE_TIME] = room_speed * time;
	screen_shake_amount = amount;
}