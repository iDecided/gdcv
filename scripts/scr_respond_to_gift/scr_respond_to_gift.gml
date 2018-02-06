/// @description Set's the NPC's response to being given a certain gift
/// @arg giftString The string representation of the gift you want to give the NPC

var giftString = argument0;

var owner = string_copy(giftString, 0, string_length(giftString) - 2);
var level = string_char_at(giftString, string_length(giftString));

show_debug_message("You are trying to give the NPC " + owner + " at level " + level);
show_debug_message(global.talkingTo + " deserves a gift at level " + string(global.affectionLevelMap[? global.talkingTo] + 1));