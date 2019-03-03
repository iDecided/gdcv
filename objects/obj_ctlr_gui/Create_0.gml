///@desc guiController - Create

#macro UPDATE_GUI with(obj_ctlr_gui){ event_user(0) };

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

// 04/08/2018
// Note: I need to find out why this was a string and not a variable lol
globalvar showNewGift;
showNewGift = "";

// 04/08/2018
// It turns out, I was able to handle all of that within the button parent so I no longer need this flag
// A variable for keeping track of which popup needs to be shown within the talking screen
//globalvar talkingPopup;
//talkingPopup = pointer_null;

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

// Using the number -1 to treat this like a null pointer since there isn't an ID that can be -1
globalvar conversationSurface;
conversationSurface = -1;

globalvar messagePadding;
messagePadding = 10;

globalvar totalMessageHeight;
totalMessageHeight = 0;