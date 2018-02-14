/// @description Insert description here
// You can write your code in this editor

timer = 0;
new_enemy_timer = 10;
enemy_id = 1;
counter = 0;
has_started = false;


switch(minigame_info_slave.difficulty_level) {
	case 1:
		game_length = 30;
		new_enemy_timer = 2000000;
		break;
	case 2:
		game_length = 45;
		break;
	case 3:
		game_length = 60;
		break;
	case 4:
		game_length = 75;
		break;
	case 5:
		game_length = 90;
		break;
	}	
	
switch(minigame_info_slave.sprite_pack_id) {
	case 1:
		object_set_sprite(shoot_em_player_bullet_obj, shoot_em_player_bullet_spr);
		object_set_sprite(shoot_em_enemy_random, shoot_em_enemy1_spr);
		break;
	case 2:
		//object_set_sprite(shoot_em_bullet_obj, sprite11);
		//object_set_sprite(shoot_em_enemy_random, sprite41);
		//break;
}

completed = false;

randomize();