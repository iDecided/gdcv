/// @description Insert description here
// You can write your code in this editor


//spawn enemy

enemyObj = -1;

switch(enemy_to_spawn) {
	case 0:
		enemyObj = shoot_em_enemy_random;
		break;
	case 1:
		enemyObj = shoot_em_enemy_chase;
		break;
	case 2:
		enemyObj = shoot_em_enemy_split;
		break;
	case 3:
		enemyObj = shoot_em_enemy_wall_master;
		break;
	case 4:
		enemyObj = shoot_em_enemy_tanky;
		break;
}

var new_enemy = instance_create_depth(x, y, -5, enemyObj)

instance_destroy()