/// @description Insert description here
// You can write your code in this editor

if(!tile_game_controller.has_won) {
	if(place_meeting(x, y, tile_obj)) {
		var inst = instance_place(x, y, tile_obj);
		if(inst.value == tile_game_controller.target) {
			show_message("Win!");
			tile_game_controller.has_won = true;
		}
	}
}