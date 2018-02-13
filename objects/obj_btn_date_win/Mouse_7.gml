/// @description Insert description here
// You can write your code in this editor

show_debug_message("You finished the date. Deleting: " + global.talkingTo);


// There are three things that need to happen here:
// 1) Delete the date from the list of planned dates
// 2) Advance the time of day
// 3) Increase affection and affection level
ds_map_delete(global.plannedDates, global.talkingTo);
scr_advance_tod();
scr_add_affection(5, true);

event_inherited();