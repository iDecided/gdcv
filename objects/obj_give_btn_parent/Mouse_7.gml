/// @description Prompt the user for which gift they'd like to give the person
// You can write your code in this editor

// Journal Entry: 02/13/2018, 6:50 AM
// It's been a long night, but it was right around this time that I realized I was planning around this whole "trigger response"
// system that I haven't even implemented yet. But I realized that I could start leaving myself clues as to where I need to 
// trigger responses once I do have it created. I made sure to tell myself that it was implemented so that if I ever see this
// in the debug log, I know it needs to be implemented once, or after, I complete the trigger system.
if(global.plannedDates[? global.talkingTo]) {
	// Trigger Waiting4Date response
	show_debug_message("Should be triggering a Waiting4Date response (not implemented)");
	return;
}

// 04/07/2018
// One of the first complaints I got was that you could open both the trinket and the gift popups at the same
// time when you were talking to someone. These lines fix that by grabbing all of the other objects with this 
// as a parent and performs the left click on it. I also learned here that with() grabs children too if you supply
// it an object that acts as a parent to other children
//with (obj_give_btn_parent) {
//	if (id != other.id) {
//		show_debug_message(object_get_name(id.object_index));
//		// GODDAMMIT THIS WON'T WORK ANYWAYS BECAUSE IT'LL JUST ACTIVATE BOTH ON FIRST HIT
//		// Okay, so here's what I think I need to do...
//		// Move all the object drawing and deleting code from left click in to draw and put it in a check
//		// Then I just need to change the _choosing variable
//		// Idk, my heart is telling me this won't actually work.
//		// event_perform(ev_left_release,0);
//	}
//}

// Oh my God, those sentence is impossible to read if you don't understand how the not operator works as a programmer.
// This and then the if statement, I mean. Cuz out of context it's like...we set the variable to something like !choosing and 
// we're checking to see if we set it to !choosing, which literally makes no sense unless you're a programmer
//_choosing = !_choosing;
//if(!_choosing) {
//	for (var i = 0; i < ds_list_size(_childrenObjs); ++i) {
//		instance_destroy(_childrenObjs[| i], true);
//	}
//	ds_list_clear(_childrenObjs);
//}
//_childrenDrawn = false;

_choosing = !_choosing;

// 04/08/2018 2:41A
// Alright, so I've figured it out. Now that I've pared it down to where all you have to do is set one variable no matter
// where, I am now going to just use a 'with all but myself' recipe and set choosing to false.
// Also, this worked so fuck yeah
// Also, also, I'm at a game jam, that's why I'm up so late
with (obj_give_btn_parent) {
	if (id != other.id) {
		//show_debug_message(object_get_name(id.object_index));
		_choosing = false;
	}
}