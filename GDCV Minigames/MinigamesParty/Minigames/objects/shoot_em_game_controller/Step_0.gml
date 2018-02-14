/// @description Insert description here
// You can write your code in this editor

if(has_started) {
	timer += delta_time/1000000;
	new_enemy_timer -= delta_time/1000000;

	if(!completed) {
		
		if(new_enemy_timer < 0) {
		new_enemy_timer = 10;
		alarm[enemy_id] = 2 * room_speed;
		enemy_id++;
		
			//only spawn X types of enemies on level X (1 on 1, 2 on 2, etc.)
			if(enemy_id >= minigame_info_slave.difficulty_level) {
				new_enemy_timer = 200000;
			}
		}
	
		if(timer >= game_length) {
			completed = true;
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[2] = -1;
			alarm[3] = -1;
			alarm[4] = -1;
		}

	}

	if (completed) {
		if(shoot_em_player_obj.my_health <= 0) {
			audio_stop_all();
			minigame_info_slave.did_win = false;
			minigame_info_slave.draw_something = true;
			room_goto(startingRoom);
		}
		else if(instance_number(shoot_em_spawn_location) == 0 && instance_number(shoot_em_enemy_obj) == 0) {
			audio_stop_all();
			minigame_info_slave.did_win = true;
			minigame_info_slave.draw_something = true;
			room_goto(startingRoom);
		}
	}

}