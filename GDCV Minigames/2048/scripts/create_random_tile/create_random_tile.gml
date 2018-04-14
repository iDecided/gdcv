///create_random_tile()

var board_start_x = board_grid_obj.x + 36;
var board_start_y = board_grid_obj.y + 36;

//lol this is dumb. Don't do this.
var available_slots_list_x = ds_list_create();
var available_slots_list_y = ds_list_create();

for(var i = 0; i < 7; i++) {
	for(var j = 0; j < 7; j++) {
		//if((!place_meeting(board_start_x + 32 + i*72, board_start_y + 32 + j*72, tile_obj))) {
		if(!(place_meeting(board_start_x + i*72, board_start_y + j*72, tile_obj))
		&& !(place_meeting(board_start_x + i*72, board_start_y + j*72, wall_obj))) {
			ds_list_add(available_slots_list_x, i);
			ds_list_add(available_slots_list_y, j);
		}
	}
}

if(!ds_list_empty(available_slots_list_x)) {
	var rand_i = irandom(ds_list_size(available_slots_list_x)-1);
	var rand_slot_x = available_slots_list_x[| rand_i];
	var rand_slot_y = available_slots_list_y[| rand_i];
	
	
	show_debug_message("Rand slot: " + string(ds_list_size(available_slots_list_x)));
	//show_debug_message(real(string_char_at(rand_slot, 0)));
	//show_debug_message(real(string_char_at(rand_slot, 2)));
	var rand_x = board_start_x + (72*rand_slot_x);
	var rand_y = board_start_y + (72*rand_slot_y);
	show_debug_message(string(rand_x) + ", " + string(rand_y));
	instance_create_depth(rand_x, rand_y, -100, tile_obj);
	
	ds_list_destroy(available_slots_list_x);
	ds_list_destroy(available_slots_list_y);
	
	return true;
}

//game over
ds_list_destroy(available_slots_list_x);
ds_list_destroy(available_slots_list_y);

return false;