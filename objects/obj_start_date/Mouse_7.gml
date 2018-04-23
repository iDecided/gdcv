/// @description Insert description here
// You can write your code in this editor

minigame_info_slave_w_pause.difficulty_level = clamp(global.affectionLevelMap[? global.talkingTo], 1, 5);
//show_debug_message("rm_date_" + string(global.tod));

// Daynamically chooses which room to go to
room_goto(asset_get_index("rm_date_" + string(global.tod)));
//room_goto(rm_date_0);