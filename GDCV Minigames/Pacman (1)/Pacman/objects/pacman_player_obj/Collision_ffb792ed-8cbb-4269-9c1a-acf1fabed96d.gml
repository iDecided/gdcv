/// @description Insert description here
// You can write your code in this editor

if(other.scared) {
	with(other) {
		instance_destroy();
	}
	pacman_game_controller.current_dots += 5;
}
else {
	//restart world
	myLives--;
	
	if(myLives == -1) {
		minigame_info_slave.did_win = false;
		minigame_info_slave.draw_something = true;
		room_goto(startingPacmanRoom);
	}
	/*
	with(enemy_obj) {
		x = startX;
		y = startY;
	
		canMove = true;
		moveDir = "None";
	}*/
	
	with(pacman_enemy_obj) {
		instance_destroy();
	}
	
	with(instance_create_depth(pacman_game_controller.spawnerXR1, pacman_game_controller.spawnerYR1, -10, pacman_spawner_obj)) {
		shouldMoveRand = true;
	}
	
	with(instance_create_depth(pacman_game_controller.spawnerXR2, pacman_game_controller.spawnerYR2, -10, pacman_spawner_obj)) {
		shouldMoveRand = true;
	}
	
	with(instance_create_depth(pacman_game_controller.spawnerXR3, pacman_game_controller.spawnerYR3, -10, pacman_spawner_obj)) {
		shouldMoveRand = true;
	}

	canMove = true;
	moveDir = "None";

	if(pacman_game_controller.cameraX1 == 1280) {
		x = pacman_game_controller.playerStartXR1;
		y = pacman_game_controller.playerStartYR1;
	}
	else if(pacman_game_controller.cameraX1 == 1280+736) {
		x = pacman_game_controller.playerStartXR2;
		y = pacman_game_controller.playerStartYR2;
	}
	else {
		x = pacman_game_controller.playerStartXR3;
		y = pacman_game_controller.playerStartYR3;
	}


	}