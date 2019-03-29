/// @description Insert description here
// You can write your code in this editor

show_debug_message("You finished the date. Deleting: " + global.talkingTo);


// There are three things that need to happen here:
// 1) Delete the date from the list of planned dates
// 2) Advance the time of day
// 3) Increase affection and affection level
// 4) Give the character a new random item
// 5) Send them back to the talking screen
ds_map_delete(global.plannedDates, global.talkingTo);
scr_advance_tod();
scr_add_affection(5, true);

var receivedRandomGift = false;
var giftStr;

//Goes to find a random person and picks a gift.
//Check if random person name is same as global.talkingTo 
//Check if level is correct
do {
	var randPers = global.names[| irandom_range(0, ds_list_size(global.names) - 1)];
	while(randPers == global.talkingTo)
	{
		randPers = global.names[| irandom_range(0, ds_list_size(global.names) - 1)];
	}
	giftStr = randPers + "_" + string(global.affectionLevelMap[? randPers] + 1);
	receivedRandomGift = scr_add_gift(randPers, global.affectionLevelMap[? randPers] + 1);
} until (receivedRandomGift);

global.showNewGift = giftStr;

UPDATE_GUI;

room_goto(rm_talking);
// event_inherited();