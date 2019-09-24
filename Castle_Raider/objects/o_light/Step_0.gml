if (col == c_black) {

	switch (type) {
		case 0:
			//wall torch
			intensity = .4;
			radius = 34;
			col = make_color_rgb(220, 134, 59);
		break;
		case 1:
			//window
			intensity = .2;
			radius = 27;
			col = make_color_rgb(220, 134, 59);
			flickering = false;
		break;
		case 2:
			//chest
			intensity = .25;
			radius = 40;
			col = c_red;
			flickering = false;
		break;
		case 3:
			//water
			intensity = .3;
			radius = 20;
			col = c_aqua;
		break;
		case 4:
			//gem
			intensity = .4;
			radius = 15;			
			switch (col_index) {
				case 0:
					col = c_lime;
				break;
				case 1:
					col = c_yellow;
				break;
				case 2:
					col = c_aqua;
				break;
				case 3:
					col = c_purple;
				break;
				case 4:
					col = c_red;
				break;
			}
	}

}