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

scr_globalvars();
global.tod = time.morning; 
global.date = date_create_datetime(2017,1,1,8,0,0);

globalvar currentRoom;

globalvar talkingTo;

// Initialize character schedules
globalvar scheduleMap;
scheduleMap = scr_load_json("character_schedules.json");