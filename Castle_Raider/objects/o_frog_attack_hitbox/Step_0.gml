//cycle through all enemies and see if they were hit
with(instance_place(x, y, o_player)) {
	processEnemyAttack(5, 2.5);
}



//enable death at begin step
die = true;