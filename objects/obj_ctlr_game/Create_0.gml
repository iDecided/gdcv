/// @description Insert description here
// You can write your code in this editor
scr_globalvars();
global.tod = time.morning; 
global.hod = 12.0;


// Initialize character schedules
scheduleMap = scr_load_json("character_schedules.json");
jacobRoomSched = scheduleMap[? "jacob_room"];
jacobSpotSched = scheduleMap[? "jacob_spot"];
show_debug_message("Jacob room schedule: ");
show_debug_message(jacobRoomSched[| 0]);
show_debug_message(jacobSpotSched[| 0]);
