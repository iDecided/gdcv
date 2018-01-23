/// @description Insert description here
// You can write your code in this editor

show_debug_message("You finished the date. Deleting: " + global.talkingTo);

ds_map_delete(global.plannedDates, global.talkingTo);

scr_advance_tod();

event_inherited();