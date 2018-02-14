/// @description Insert description here
// You can write your code in this editor

if(room == startingPacmanRoom) {

//minigame_info_slave.difficulty_level = 1;
minigame_info_slave.did_win = false;
minigame_info_slave.sprite_pack_id = 1;

var target_room;

switch(minigame_info_slave.difficulty_level) {
	case 1:
		target_room = pacman_room1;
		break;
	case 2:
		target_room = pacman_room2;
		break;
	case 3:
		target_room = pacman_room3;
		break;
	case 4:
		target_room = pacman_room4;
		break;
	case 5:
		target_room = pacman_room5;
		break;
}

room_goto(target_room);
}
else {
	
	instance_create_depth(pacman_game_controller.spawnerXR1, pacman_game_controller.spawnerYR1, 0, pacman_spawner_obj);
	instance_create_depth(pacman_game_controller.spawnerXR2, pacman_game_controller.spawnerYR2, 0, pacman_spawner_obj);
	instance_create_depth(pacman_game_controller.spawnerXR3, pacman_game_controller.spawnerYR3, 0, pacman_spawner_obj);
	
	pacman_game_controller.gameStarted = true;
	pacman_game_controller.alarm[0] = room_speed * 17;
	pacman_game_controller.zoomIn = true;
	instance_destroy();
}

