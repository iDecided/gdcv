/// @description Insert description here
// You can write your code in this editor

if(plannedDate[? "day"] != "" && plannedDate[? "time"] != "" && plannedDate[? "location"] != "") {
	global.plannedDates[? global.talkingTo] = plannedDate;
	//show_debug_message(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") + ds_map_find_value(global.plannedDates[? global.talkingTo], "time") + ds_map_find_value(global.plannedDates[? global.talkingTo], "location"));
	global.planningDate = false;
	global.talkingTo = "";
	room_goto(global.currentRoom);
}