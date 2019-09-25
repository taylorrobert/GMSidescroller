with (other) {
	if (can_pickup) {
		die = true;
		with(other) {
			if (hp < max_hp) hp++;	
		}
	}
}