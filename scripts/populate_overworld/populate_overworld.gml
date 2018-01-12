/// Called from the game_ctlr to populate the current room with characters
/// In the future, with take the character's schedules into account as well


// ~~ Old way before adding days to the mix ~~
//for(var i=0; i<ds_list_size(global.names); i++) {
//	var roomSched = global.scheduleMap[? global.names[| i] + "_room"];
//	var accessor = scr_get_hr_grid_accessor();
//	if(roomSched[| accessor] == room_get_name(room)) {
//		with(instance_find(obj_ovw_char_prnt, i))
//		{
//			image_xscale = 0.1;
//			image_yscale = 0.1;
//			character = global.names[| i];
//			sprite_index = asset_get_index("spr_char_" + character + "_ovw");
//		}
//	}
//	else {
//		with(instance_find(obj_ovw_char_prnt, i))
//		{
//			image_xscale = 1;
//			image_yscale = 1;
//			character = "";
//			sprite_index = -1;
//		}
//	}
//}

for(var i=0; i<ds_list_size(global.names); i++) {
	var day = date_get_weekday(global.date);
	var roomSched = global.schedules[? global.names[| i]];
	var accessor = scr_get_hr_grid_accessor();
	if(roomSched[# day, accessor] == room_get_name(room)) {
		with(instance_find(obj_ovw_char_prnt, i))
		{
			image_xscale = 0.1;
			image_yscale = 0.1;
			character = global.names[| i];
			sprite_index = asset_get_index("spr_char_" + character + "_ovw");
		}
	}
	else {
		with(instance_find(obj_ovw_char_prnt, i))
		{
			image_xscale = 1;
			image_yscale = 1;
			character = "";
			sprite_index = -1;
		}
	}
}