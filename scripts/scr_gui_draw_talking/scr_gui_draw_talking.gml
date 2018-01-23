// I copy-pasted these checks from scr_populate_overworld
var day = date_get_weekday(global.date);
var roomSched = global.schedules[? global.talkingTo];
var accessor = scr_get_hr_grid_accessor();

if(global.plannedDates[? global.talkingTo]) {
	show_debug_message("They should be showing the start date button");
	if(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") == day && ds_map_find_value(global.plannedDates[? global.talkingTo], "time") == global.tod) {
		var startObj = instance_create_depth(258, 187, 0, obj_start_date);
		ds_list_add(argument0, startObj);
	}
} 