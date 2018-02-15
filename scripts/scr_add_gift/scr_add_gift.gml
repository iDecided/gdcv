/// @description Adds gifts to the player's inventory automatically
/// @arg0 owner (String) The name of the NPC that will accept this gift
/// @arg1 level (String) The level of the gift that the NPC should accept it at

// This could probably pretty easily be changed to create a logical order that they get added in
// so that the inventory screen doesn't look so hectic after they've given and received a bunch of gifts

var giftName = string(argument0) + "_" + string(argument1);
for(var i = 0; i < global.maxGifts; ++i)
{
	// They already have this item, they shouldn't be able to get two of them.
	if(global.gifts[i] == giftName) {
		show_debug_message("The player already has that item.");
		return(false);
	}
	
	// We've found an empty space! Put that shit in there!
	if(global.gifts[i] == "")
	{
		show_debug_message("Adding: " + giftName);
		global.gifts[i] = giftName;
		return(true);
	}
}
show_debug_message("Inventory is full.");
return(false);