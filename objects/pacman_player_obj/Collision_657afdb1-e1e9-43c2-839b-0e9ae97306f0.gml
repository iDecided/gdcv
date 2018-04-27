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
		//minigame_info_slave.draw_something = true;
		
		// LOSE STATE (set gamestate variables accordingly to go back and not receive a gift...)
		//room_goto(rm_date_0);
		// There are three things that need to happen here:
		
		// 04/24/2018
		// This is was copy-pasted from the win state, but modified to work with losing.
		// 1) Delete the date from the list of planned dates
		// 2) Advance the time of day
		// 3) Send them back to the talking screen
		// 4) Trigger disappointed response
		
		ds_map_delete(global.plannedDates, global.talkingTo);
		scr_advance_tod();
		//scr_add_affection(5, true);
		//var receivedRandomGift = false;
		//var giftStr;
		//do {
		//	var randPers = global.names[| irandom_range(0, ds_list_size(global.names) - 1)];
		//	giftStr = randPers + "_" + string(global.affectionLevelMap[? randPers] + 1);
		//	receivedRandomGift = scr_add_gift(randPers, global.affectionLevelMap[? randPers] + 1);
		//} until (receivedRandomGift);
		//global.showNewGift = giftStr;
		UPDATE_GUI;
		room_goto(rm_talking);
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