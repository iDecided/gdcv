/// @description Redraws the GUI objects, but not the usual draw event or anything

// It should be mentioned that this only works because the controller is a singleton
// Which means that I'm going to need to teach them what a singleton is.
// I also think there's another way we could do this, but ehhhh...
// Code for managing the list of objects that need spawned for the GUI
for(var i=0; i < ds_list_size(ls_guiObjects); i++){
	//show_debug_message("Should be destroying all of the owv gui elements");
	instance_destroy(ls_guiObjects[| i]);
}
ds_list_empty(ls_guiObjects);

// This is what draws all the objects onto the screen no matter where you are
// 04/08/2018
// This is where I'm going to put the trinket frontend update call and where I should almost definitely move the 
// frontend portion of the populate world code as well
scr_draw_gui(menu_state, ls_guiObjects);