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

scr_init_inventory();