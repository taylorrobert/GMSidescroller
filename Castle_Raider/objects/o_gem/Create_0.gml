vsp_initial = random_range(-6, -3);
vsp = vsp_initial;

hsp_initial = random_range(2, 5) * choose(-1, 1);
hsp = hsp_initial;

hsp_decimal = 0;
vsp_decimal = 0;

drag = 0.05;

die = false;

//pick color
image_index = irandom(image_number - 1);

//has bounce happened yet
bounce = false;

//can player pick up this yet?
can_pickup = false;