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

globalvar names;
global.names = ds_list_create();
ds_list_add(global.names, "jacob", "cole", "isabel", "veronica", "ryan", "mario");

globalvar tod;
globalvar date;

global.tod = time.morning; 
global.date = date_create_datetime(2017,1,1,8,0,0);

globalvar currentRoom;
globalvar talkingTo;

// Initialize character schedules
globalvar schedules;
schedules = ds_map_create();
scr_init_schedules(schedules);

globalvar plannedDates;
plannedDates = ds_map_create();

global.scheduleMap = scr_load_json("character_schedules.json");