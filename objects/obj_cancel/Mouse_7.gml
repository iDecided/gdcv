/// @description Insert description here
// You can write your code in this editor

layer_destroy(layer_get_id("datePicker_bg"));
layer_destroy_instances(layer_get_id("datePicker_obj"));
layer_destroy(layer_get_id("datePicker_obj"));
// This is an awful fix, for it just redrawing the datepicker if you delete the layer, but it works for now
global.planningDate = false;
/*
if(obj_talking_prnt.plannedDate[? "day"] != "" && obj_talking_prnt.plannedDate[? "time"] != "" && obj_talking_prnt.plannedDate[? "location"] != "") {
	global.plannedDates[? global.talkingTo] = obj_talking_prnt.plannedDate;
	//show_debug_message(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") + ds_map_find_value(global.plannedDates[? global.talkingTo], "time") + ds_map_find_value(global.plannedDates[? global.talkingTo], "location"));
	global.talkingTo = "";
	room_goto(global.currentRoom);
}
*/