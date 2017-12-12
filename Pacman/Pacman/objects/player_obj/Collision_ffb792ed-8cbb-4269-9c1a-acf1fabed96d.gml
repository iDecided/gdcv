/// @description Insert description here
// You can write your code in this editor

if(other.scared) {
	with(other) {
		instance_destroy();
	}
}
else {
	//restart world
	myLives--;
	
	if(myLives == -1) {
		minigame_info_slave.did_win = false;
		minigame_info_slave.draw_something = true;
		room_goto(startingRoom);
	}
	/*
	with(enemy_obj) {
		x = startX;
		y = startY;
	
		canMove = true;
		moveDir = "None";
	}*/
	
	with(enemy_obj) {
		instance_destroy();
	}
	
	with(instance_create_depth(1632, 160, -10, spawner_obj)) {
		shouldMoveRand = true;
	}
	
	with(instance_create_depth(2368, 96, -10, spawner_obj)) {
		shouldMoveRand = true;
	}
	
	with(instance_create_depth(1984, 736, -10, spawner_obj)) {
		shouldMoveRand = true;
	}

	canMove = true;
	moveDir = "None";

	if(game_controller.cameraX1 == 1280) {
		x = 1632;
		y = 448;
	}
	else if(game_controller.cameraX1 == 1280+736) {
		x = 2368;
		y = 448;
	}
	else {
		x = 1984;
		y = 928;
	}


	}