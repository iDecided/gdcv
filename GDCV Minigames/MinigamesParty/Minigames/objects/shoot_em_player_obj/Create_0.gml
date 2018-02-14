/// @description Insert description here
// You can write your code in this editor

moveSpeed = 6;
shotRate = 0.2;
timer = 0.0;

switch(minigame_info_slave.difficulty_level) {
	case 1:
		my_health = 20;
		break;
	case 2:
		my_health = 18;
		break;
	case 3:
		my_health = 16;
		break;
	case 4:
		my_health = 13;
		break;
	case 5:
		my_health = 10;
		break;
	}	

max_health = my_health;