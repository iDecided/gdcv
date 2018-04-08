///@desc gameController - Create

randomize();

#region Singleton Pattern Stuff
// declare our singleton's global variable so we don't need to check if it exists
gml_pragma("global", "global.gameController = noone;"); 
  
if (instance_exists(global.gameController)) {
    if (global.gameController != id)
        instance_destroy(id);
    exit;
}
// setup our global accessor for ease of use, but also not relying on object name
global.gameController = id;
#endregion

enum time {
	morning,
	afternoon,
	night
};

enum people {
	jacob,
	cole,
	isabel,
	veronica,
	ryan,
	mario
};

// A global list of names so that you can loop over them
// Names is a very strange variable. It not only acts as a list of names, but also acts as the
// variable that keeps track of who you've met. Since I use this as the basis of what anything that has
// to do with people, if someone's name isn't in it, it will just skip over them and not matter anymore
globalvar names;
global.names = ds_list_create();
// I think I'm going to rework the game to always draw stuff based off if this list and its length
ds_list_add(global.names, "jacob", "cole", "isabel", "veronica");
//ds_list_add(global.names, "jacob", "cole", "isabel", "veronica", "ryan", "mario");

// Date and time variables and initialization
globalvar tod;
globalvar date;
global.tod = time.morning; 
global.date = date_create_datetime(2017,1,1,8,0,0);

// Initialize character schedules
globalvar schedules;
schedules = ds_map_create();
scr_init_schedules(schedules);

// A map of maps that contain the details of any dates that the player has planned
globalvar plannedDates;
plannedDates = ds_map_create();

globalvar affectionMap;
affectionMap = ds_map_create();
affectionMap[? "jacob"] = 20;
affectionMap[? "cole"] = 0;
affectionMap[? "isabel"] = 0;
affectionMap[? "veronica"] = 0;
affectionMap[? "ryan"] = 0;
affectionMap[? "mario"] = 0;

globalvar affectionLevelMap;
affectionLevelMap = ds_map_create();
affectionLevelMap[? "jacob"] = 0;
affectionLevelMap[? "cole"] = 0;
affectionLevelMap[? "isabel"] = 0;
affectionLevelMap[? "veronica"] = 0;
affectionLevelMap[? "ryan"] = 0;
affectionLevelMap[? "mario"] = 0;


// Global variables that really should be values passed around as arguments, but eh.
globalvar currentRoom;
globalvar talkingTo;
globalvar detailedCharacter;


// Global settings variables that will need to transfer stuff between play sessions
// These will need to be set using some sort of settings or config file
// Also, these will need to be determined like...right away.
// Essentially, these should be done first and then either initialize all the above variables with the save data
// or initialize them to what it currently is.
globalvar hasUnlockedAllChars;
hasUnlockedAllChars = false;
globalvar hasSaveData;
hasSaveData = false;