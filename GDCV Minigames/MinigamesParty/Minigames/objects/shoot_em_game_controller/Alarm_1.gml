/// @description Insert description here
// You can write your code in this editor

//spawn chase enemy
//96 to 656
var xPos = random(656 - 96) + 96;

//128 to 544
var yPos = random(544 - 128) + 128;
	
var spawnPoint = instance_create_depth(xPos, yPos, -5, shoot_em_spawn_location);
with(spawnPoint) enemy_to_spawn = 1;


var offset = minigame_info_slave.difficulty_level * 0.2;

//3.1
//2.9
//2.7
//2.5
alarm[1] = room_speed * (3.5 - offset);