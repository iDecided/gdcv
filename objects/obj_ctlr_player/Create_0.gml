///@desc playerController - Create
#region Singleton Pattern Stuff
// declare our singleton's global variable so we don't need to check if it exists
gml_pragma("global", "global.playerController = noone;"); 
  
if (instance_exists(global.playerController)) {
    if (global.playerController != id)
        instance_destroy(id);
    exit;
}
// setup our global accessor for ease of use, but also not relying on object name
global.playerController = id;
#endregion

// The maximum number of gifts that a player can hold at any given time
globalvar maxGifts;
global.maxGifts = 30;

// An array for keep track of the gifts that the player has accrued
globalvar gifts;
global.gifts = array_create(maxGifts, "");

// Enums for easy access to the trinkets array
// To be renamed later once the trinkets have been properly named
enum trinket {
	tr_1,
	tr_2,
	tr_3,
	tr_4,
	tr_5,
	tr_6
};

// A variable that keeps track of how many different types of trinkets there are in the game
globalvar numTrinketTypes;
numTrinketTypes = 6;

// An array for keeping track of the trinkets that the player has found
// Set in scr_init_inventory()
globalvar trinkets;

scr_init_inventory();