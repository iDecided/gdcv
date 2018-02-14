/// @description Insert description here
// You can write your code in this editor

shouldSpawnRand = false;
zoomIn = false;	
gameStarted = false;

cameraX1 = 0;
cameraX2 = 0;
cameraY1 = 0;
cameraY2 = 0;

cameraTargetX = 0;
cameraTargetY = 0;

cameraTransition = false;

current_dots = 0;
goal_dots = 0; 

playerStartXR1 = 0;
playerStartYR1 = 0;
playerStartXR2 = 0;
playerStartYR2 = 0;
playerStartXR3 = 0;
playerStartYR3 = 0;

spawnerXR1 = -100;
spawnerYR1 = -100;
spawnerXR2 = -100;
spawnerYR2 = -100;
spawnerXR3 = -100;
spawnerYR3 = -100;

if(minigame_info_slave.difficulty_level == 1) {
	//level 1 has 358 regular dots, 8 big ones
	goal_dots = 250;
	
	playerStartXR1 = 1632;
	playerStartYR1 = 384;
	playerStartXR2 = 2368;
	playerStartYR2 = 448;

	spawnerXR1 = 1632;
	spawnerYR1 = 192;
	spawnerXR2 = 2368;
	spawnerYR2 = 192;

}
else if(minigame_info_slave.difficulty_level == 2) {
	//level 2 has 385 regular dots, 8 big ones
	goal_dots = 300;
	
	playerStartXR1 = 1632;
	playerStartYR1 = 448;
	playerStartXR2 = 2368;
	playerStartYR2 = 384;

	spawnerXR1 = 1632;
	spawnerYR1 = 160;
	spawnerXR2 = 2368;
	spawnerYR2 = 192;
}
else if(minigame_info_slave.difficulty_level == 3) {
	//level 2 has 468 regular dots, 12 big ones
	goal_dots = 400;
	
	playerStartXR1 = 1632;
	playerStartYR1 = 416;
	playerStartXR2 = 2368;
	playerStartYR2 = 384;
	playerStartXR3 = 1984;
	playerStartYR3 = 1024;

	spawnerXR1 = 1632;
	spawnerYR1 = 224;
	spawnerXR2 = 2368;
	spawnerYR2 = 160;
	spawnerXR3 = 1984;
	spawnerYR3 = 704;
}
else if(minigame_info_slave.difficulty_level == 4) {
	goal_dots = 400;
}
else if(minigame_info_slave.difficulty_level == 5) {
	//level 5 has 623 (I think) dots, 12 big ones.
	goal_dots = 500;
	
	playerStartXR1 = 1632;
	playerStartYR1 = 448;
	playerStartXR2 = 2368;
	playerStartYR2 = 448;
	playerStartXR3 = 1984;
	playerStartYR3 = 928;

	spawnerXR1 = 1632;
	spawnerYR1 = 160;
	spawnerXR2 = 2368;
	spawnerYR2 = 96;
	spawnerXR3 = 1984;
	spawnerYR3 = 736;
	
}
