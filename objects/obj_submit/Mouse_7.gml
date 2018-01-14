/// @description Insert description here
// You can write your code in this editor

if(obj_talking_prnt.plannedDate[? "day"] != "" && obj_talking_prnt.plannedDate[? "time"] != "" && obj_talking_prnt.plannedDate[? "location"] != "") {
	global.plannedDates[? global.talkingTo] = obj_talking_prnt.plannedDate;
	//show_debug_message(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") + ds_map_find_value(global.plannedDates[? global.talkingTo], "time") + ds_map_find_value(global.plannedDates[? global.talkingTo], "location"));
	global.talkingTo = "";
	room_goto(global.currentRoom);
}