/// @description Insert description here
// You can write your code in this editor

if(room == startingRoom) {

//minigame_info_slave.difficulty_level = 1;
minigame_info_slave.did_win = false;
minigame_info_slave.sprite_pack_id = 1;
room_goto(gameRoom);
}
else {
	instance_destroy()
	shoot_em_game_controller.has_started = true;
	shoot_em_game_controller.alarm[0] = 1 * room_speed;
	audio_play_sound(shoot_em_main_music_snd, 50, true);
}
