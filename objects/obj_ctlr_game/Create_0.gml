/// @description Insert description here
// You can write your code in this editor
scr_globalvars();
global.tod = time.morning; 
global.date = date_create_datetime(2017,1,1,8,0,0);

globalvar currentRoom;

globalvar talkingTo;

// Initialize character schedules
globalvar scheduleMap;
scheduleMap = scr_load_json("character_schedules.json");