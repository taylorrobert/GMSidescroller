/// calcMovement();

hsp += (right - left) * walk_spd;
vsp += global.grav;

//drag
hsp = lerp(hsp, 0, drag);

//stop
if (abs(hsp) <= 0.1) hsp = 0

//face correct way
if (hsp != 0) facing = sign(hsp);

//imit speed
hsp = min(abs(hsp), max_hsp) * facing;