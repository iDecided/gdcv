/// @description Insert description here
// You can write your code in this editor

//spawn wall enemy
var xPos;
var yPos;
var breakOut = false;

var xMin = 47;
var xMax = 732;
var yMin = 74;
var yMax = 627;

do {
	xPos = irandom(xMax);	
	yPos = irandom(yMax);
	
	if(xPos == xMin || xPos == xMax) {
		if(yPos > yMin && yPos < yMax) {
		breakOut = true;
		}
	}
	
	else if (yPos == yMin|| yPos == yMax) {
		if(xPos > xMin && xPos < xMax) {
			breakOut = true;
		}
	}
	
	} until(breakOut);
	
	
var spawnPoint = instance_create_depth(xPos, yPos, -5, shoot_em_spawn_location);
with(spawnPoint) enemy_to_spawn = 3;

var offset = minigame_info_slave.difficulty_level * 0.5;

//8
//7.5
alarm[3] = room_speed * (10-offset);