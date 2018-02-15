/// @description Adds gifts to the player's inventory automatically
/// @arg0 gift The item that you want to search for within the player's inventory

// This could probably pretty easily be changed to create a logical order that they get added in
// so that the inventory screen doesn't look so hectic after they've given and received a bunch of gifts

var _gift = argument0;
var debugStr = "Searching for " + _gift;
for(var i = 0; i < global.maxGifts; ++i) {
	debugStr += " . ";
	// Found the item we were checking for!
	if(global.gifts[i] == _gift) {
		debugStr += "FOUND IT";
		show_debug_message(debugStr);
		return(true);
	}
}
debugStr += "Yeah, I don't think they have it.";
show_debug_message(debugStr);
return(false);