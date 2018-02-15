/// @description Insert description here
// You can write your code in this editor

// This isn't a perfect solution, because it depends on being in the talking room,
// since it uses global.talkingTo
if(_interactive) {
	var gift = _giftRecip + "_" + _giftLevel;
	// I do believe that this will need to be moved to the gifts that will display in the gift selector
	if(scr_check_for_item(gift)) {
		global.planningDate = scr_respond_to_gift(gift);
	}
}

// Have to call UPDATE_GUI because global.planningDate uses GUI objects, not just sprites.
UPDATE_GUI;