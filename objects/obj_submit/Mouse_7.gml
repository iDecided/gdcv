/// @description Insert description here
// You can write your code in this editor

if(plannedDate[? "day"] != "" && plannedDate[? "time"] != "" && plannedDate[? "location"] != "") {
	// 04/23/2018
	// As I was working with saving and loading, I had to come back to this and change it to add the map to the plannedDates map
	// via this new function instead of what's below it. This way, GMS knows that it's a map within a map and when I use json_encode
	// or whatever, it'll write the map correctly.
	ds_map_add_map(global.plannedDates, global.talkingTo, plannedDate);
	//global.plannedDates[? global.talkingTo] = plannedDate;
	//show_debug_message(ds_map_find_value(global.plannedDates[? global.talkingTo], "day") + ds_map_find_value(global.plannedDates[? global.talkingTo], "time") + ds_map_find_value(global.plannedDates[? global.talkingTo], "location"));
	global.planningDate = false;
	global.talkingTo = "";
	room_goto(global.currentRoom);
}