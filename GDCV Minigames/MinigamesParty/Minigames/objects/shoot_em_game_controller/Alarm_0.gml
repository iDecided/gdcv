/// @description Insert description here
// You can write your code in this editor

//spawn random enemy

//96 to 656
var xPos = random(656 - 96) + 96;

//128 to 544
var yPos = random(544 - 128) + 128;
	
var spawnPoint = instance_create_depth(xPos, yPos, -5, shoot_em_spawn_location);
with(spawnPoint) enemy_to_spawn = 0;

var offset = minigame_info_slave.difficulty_level * 0.1;

//1.9
//1.8
//1.7
//1.6
//1.5
alarm[0] = room_speed * (2 - offset);