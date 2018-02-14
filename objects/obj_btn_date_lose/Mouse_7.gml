/// @description Insert description here
// You can write your code in this editor

show_debug_message("You lost the date. Deleting: " + global.talkingTo);


// There are three things that need to happen here:
// 1) Delete the date from the list of planned dates
// 2) Advance the time of day
// 3) Give the item back to the player
ds_map_delete(global.plannedDates, global.talkingTo);
scr_advance_tod();
// Giving the item back to the player would work more as an animation at the end of a lost minigame
// Because really, it would just be set to some sort of "given" state if they won the minigame 

event_inherited();