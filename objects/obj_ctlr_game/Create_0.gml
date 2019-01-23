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

enum sender {
	pc,
	npc
};

enum respTriggers {
	greeting = 0,
	parting,
	trinket,
	gift,
	decline,
	accept
};

enum respTones {
	positive = 0,
	negative,
	indifferent,
	confused
};

enum respStrengths {
	soft = 0,
	medium,
	strong
};

enum emojies {
	nothing = 0,
	happy,
	sad,
	indifferent
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

globalvar roomNames;
roomNames = ["rm_cc", "rm_cs", "rm_dc", "rm_gdl", "rm_lib", "rm_ps", "rm_sr", "rm_ud"];

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
globalvar hasSaveData;
//var saveFile = file_text_open_write("diary.sav");
//file_text_write_string(saveFile, "Hello world");
hasSaveData = file_exists("diary.sav");
//hasSaveData = false;
globalvar hasUnlockedAllChars;
hasUnlockedAllChars = false;

globalvar isTalking;
isTalking = false;

globalvar responseReaction;
responseReaction = 0;


// 04/08/2018
// This is an array that is used to keep track of all of the statements that should appear during any given conversation
// with any person. It is dynamically filled and emptied everytime you start a conversation with one of the NPCs.
// 04/08/2018 12:53P
// Yeah turns out I don't need this. I just create the objects as I go. It's soooo much simpler than anything I planned before.
// Like...way fucking simpler. Oh the power of the 'with' statement
//globalvar texts;
//texts = [];


// 04/08/2018
// Creating a 2D array that stores where trinkets are, which will allow them to be persistent.
// Also, on second review, I might want to rename this to trinketBackend or something like trinketStruct
globalvar trinketSpawns;
trinketSpawns = ds_map_create();
globalvar numTrinketSpawners;
numTrinketSpawners = 10;
globalvar totalTrinketsSpawned;
totalTrinketsSpawned = 0;
// Initializing the 2D array
for (var i = 0; i < array_length_1d(roomNames); ++i) {
	var _list = ds_list_create();
	for (var j = 0; j < numTrinketSpawners; ++j) {
	    _list[| j] = -1;
	}
	ds_map_add_list(trinketSpawns, roomNames[i], _list);
}