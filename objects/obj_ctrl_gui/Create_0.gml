///@desc guiController - Create

#macro UPDATE_GUI with(obj_ctrl_gui){ event_user(0) };

#region Singleton Pattern Stuff
// declare our singleton's global variable so we don't need to check if it exists
gml_pragma("global", "global.guiController = noone;"); 
  
if (instance_exists(global.guiController)) {
    if (global.guiController != id)
        instance_destroy(id);
    exit;
}
// setup our global accessor for ease of use, but also not relying on object name
global.guiController = id;
#endregion

enum menu_states {
	none = 0,
	ovw,
	items,
	talking,
	people_overview,
	people_details,
	date
};

weekdayNames = ["SUN", "MON", "TUE", "WED", "THR", "FRI", "SAT"];

menu_state = menu_states.none;

ls_guiObjects = ds_list_create();

charDetails = pointer_null;

globalvar planningDate;
planningDate = false;

// This was originally how I was going to handle responses, before I realized how I could do the scrolling thing
// This would have really only worked for if there was one block of text presented at a time.
/* globalvar npcResponse;
npcResponse = "";

enum npcStates {
	def = 0,
	readyForDate,
	waitingForDate,
	monologuing
}
globalvar npcState;
npcState = npcStates.def; */