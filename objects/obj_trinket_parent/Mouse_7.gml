/// @description Insert description here
// You can write your code in this editor

// This isn't a perfect solution, because it depends on being in the talking room,
// since it uses global.talkingTo
if(_interactive) {
	scr_remove_trinket(_type);
	var responseMap = scr_load_json("trinket_responses.json");
	var talkingToResponse = ds_list_find_value(responseMap[? global.talkingTo], _type);
	
	// I could take scr_add-- and scr_sub_affection and put them into one script that just determined
	// what to do based on if it's negative or not, but I think it would be easier for a first timer to
	// understand if I kept the two separated. Then they can see what's going on quite a bit better.
	if(talkingToResponse > 0) {
		scr_add_affection(talkingToResponse, false);
		// Trigger a positive dialog
	}
	else if(talkingToResponse < 0) {
		// Negative responses are stored as negatives, but scr_sub_affection expects positive numbers
		scr_sub_affection(talkingToResponse * -1, false);
		// Trigger an negative dialog
	}
	else {
		// Do nothing to their affection
		// Trigger an indifferent dialog
	}
}