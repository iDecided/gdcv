///@desc guiController - Create

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
	people
};

weekdayNames = ["SUN", "MON", "TUE", "WED", "THR", "FRI", "SAT"];

menu_state = menu_states.none;

ls_guiObjects = ds_list_create();