/// @description Adds gifts to the player's inventory automatically
/// @arg0 owner (String) The name of the NPC that will accept this gift
/// @arg1 level (String) The level of the gift that the NPC should accept it at

// This could probably pretty easily be changed to create a logical order that they get added in
// so that the inventory screen doesn't look so hectic after they've given and received a bunch of gifts
for(var i = 0; i < global.maxGifts; ++i)
{
	if(global.gifts[i] == "")
	{
		global.gifts[i] = string(argument0) + "_" + string(argument1);
		show_debug_message("Adding: " + global.gifts[i]);
		return(1);
	}
}
show_debug_message("Inventory is full.");
return(0);