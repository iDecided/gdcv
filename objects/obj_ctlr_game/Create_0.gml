///@desc gameController - Create

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
}

// A global list of names so that you can loop over them
globalvar names;
global.names = ds_list_create();
ds_list_add(global.names, "jacob", "cole", "isabel", "veronica", "ryan", "mario");

// Date and time variables and initialization
globalvar tod;
globalvar date;
global.tod = time.morning; 
global.date = date_create_datetime(2017,1,1,8,0,0);

// Initialize character schedules
globalvar schedules;
schedules = ds_map_create();
scr_init_schedules(schedules);

// A list maps that contain the details of any dates that the player has planned
globalvar plannedDates;
plannedDates = ds_map_create();

globalvar affectionMap;
affectionMap = ds_map_create();
affectionMap[? "jacob"] = 20;
affectionMap[? "cole"] = 40;
affectionMap[? "isabel"] = 60;
affectionMap[? "veronica"] = 80;
affectionMap[? "ryan"] = 100;
affectionMap[? "mario"] = 1;


// Global variables that really should be values passed around as arguments, but eh.
globalvar currentRoom;
globalvar talkingTo;
globalvar detailedCharacter;