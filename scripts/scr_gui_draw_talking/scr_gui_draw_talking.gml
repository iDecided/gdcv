// I copy-pasted these checks from scr_populate_overworld
var day = date_get_weekday(global.date);
var roomSched = global.schedules[? global.talkingTo];
var accessor = scr_get_hr_grid_accessor(global.date);

if(global.plannedDates[? global.talkingTo]) {
	show_debug_message("They should be showing the start date button");
	if(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") == day && ds_map_find_value(global.plannedDates[? global.talkingTo], "time") == global.tod) {
		var startObj = instance_create_depth(258, 187, 0, obj_start_date);
		ds_list_add(argument0, startObj);
	}
}

if(global.affectionMap[? global.talkingTo] % 20 == 0 && global.affectionMap[? global.talkingTo] == (global.affectionLevelMap[? global.talkingTo] + 1) * 20) {
	//show_debug_message("Should be drawing the date stuff right now");
	
	var giveGift = instance_create_depth(576, 640, 0, obj_give_gift);
	ds_list_add(argument0, giveGift);
	
	// This is the code for showing the date picker menu
	//var dayPicker = instance_create_depth(160, 585, 0, obj_dropdown);
	//with(dayPicker) {
	//	defaultOption = "DAY";
	//	listType = "day";
	//}
	//ds_list_add(argument0, dayPicker);
	
	//var timePicker = instance_create_depth(423, 585, 0, obj_dropdown);
	//with(timePicker) {
	//	defaultOption = "TIME";
	//	listType = "time";
	//}
	//ds_list_add(argument0, timePicker);
	
	//var placePicker = instance_create_depth(684, 585, 0, obj_dropdown);
	//with(placePicker) {
	//	defaultOption = "LOCATION";
	//	listType = "location";
	//}
	//ds_list_add(argument0, placePicker);
	
	//var submit = instance_create_depth(576, 640, 0, obj_submit);
	//ds_list_add(argument0, submit);
}