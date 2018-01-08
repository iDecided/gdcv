/// Called from the game_ctlr to populate the current room with characters
/// In the future, with take the character's schedules into account as well

var names = ["jacob", "cole", "isabel", "veronica", "ryan", "mario"];
for(var i=0; i<array_length_1d(names); i++) {
	var roomSched = global.scheduleMap[? names[i] + "_room"];
	var spotSched = global.scheduleMap[? names[i] + "_spot"];
	var accessor = scr_det_sched_accessor();
	if(roomSched[| accessor] == room_get_name(room)) {
		with(instance_find(obj_ovw_char_prnt, spotSched[| accessor]))
		{
			image_xscale = 0.1;
			image_yscale = 0.1;
			character = names[i];
			sprite_index = asset_get_index("spr_char_" + character + "_ovw");
		}
	}
	else {
		with(instance_find(obj_ovw_char_prnt, spotSched[| accessor]))
		{
			image_xscale = 1;
			image_yscale = 1;
			character = "";
			sprite_index = -1;
		}
	}
}