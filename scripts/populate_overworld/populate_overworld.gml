/// Called from the game_ctlr to populate the current room with characters
/// In the future, with take the character's schedules into account as well

for(var i=0; i<ds_list_size(global.names); i++) {
	var roomSched = global.scheduleMap[? global.names[| i] + "_room"];
	var accessor = scr_det_sched_accessor();
	if(roomSched[| accessor] == room_get_name(room)) {
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