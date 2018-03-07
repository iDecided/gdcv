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

_choosing = !_choosing;
if(!_choosing) {
	for (var i = 0; i < ds_list_size(_giftObjs); ++i) {
		instance_destroy(_giftObjs[| i], true);
	}
	ds_list_clear(_giftObjs);
}
_giftsDrawn = false;