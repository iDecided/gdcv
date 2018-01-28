/// @description Insert description here
// You can write your code in this editor

// Moving all of this into a separate script

/*global.affectionMap[? global.talkingTo] += 4;
if(global.affectionMap[? global.talkingTo] > 20 * (global.affectionLevelMap[? global.talkingTo] + 1)) {
	global.affectionMap[? global.talkingTo] = 20 * (global.affectionLevelMap[? global.talkingTo] + 1);
}
if(global.affectionMap[? global.talkingTo] > 100) {
	global.affectionMap[? global.talkingTo] = 100;
}

show_debug_message(global.talkingTo + "'s Affection is: " + string(global.affectionMap[? global.talkingTo]) + " and their level is: " + string(global.affectionLevelMap[? global.talkingTo])); */

scr_add_affection(4, false);