/// @description Set's the NPC's response to being given a certain gift
/// @arg giftString The string representation of the gift you want to give the NPC

var giftString = argument0;

var owner = string_copy(giftString, 0, string_length(giftString) - 2);
var level = string_char_at(giftString, string_length(giftString));

show_debug_message("You are trying to give the NPC " + owner + " at level " + level);
show_debug_message(global.talkingTo + " deserves a gift at level " + string(global.affectionLevelMap[? global.talkingTo]));

// At this point, I decided to make a font called fnt_talking. It was a duplicate of fnt_people_details_bio, but set to size 24
// "Font 'fnt_talking' packs more characters than can fit on a texture page. Some characters may not be visible."
// Solution? I made the range of the font only hold the characters that are needed from the font.
// This means that this font only hold letters and numbers and punct., but in the future I can have it read in a file
// and determine what characters it needs. I'll do that before I export it.
// Tools -> Texture Groups

if(owner == global.talkingTo && level == string(global.affectionLevelMap[? global.talkingTo])) {
	show_debug_message("The NPC accepts the gift!");
	return true;
}
else {
	show_debug_message("Choose one: A) You're giving the gift to the wrong NPC, B) They already have one of those gifts, or C) The gift you're giving is too extravagent for your current relationship status.");
	return false;
}