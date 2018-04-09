/// @arg room  Pass in the room name (as a string) to incerease the chances of spawning one in the room you're in
/// @arg todChange  Flag that marks if it's from FF or superFF

/*
There are three things that are taken into account when trinkets are spawned in the game
1. What room you are in
2. How many trinkets have been dropped in the world
3. Was it done during a fast forward or a super fast forward

As more trinkets spawn in the world, your chances of spawning a trinket anywhere is decreased.

The room is then used in a clever way to help guide players towards figuring out who like where for date spots.
- If you are in a date room, there is a chance to drop the best trinket for the person who's favorite date spot is that room.

Finally, if you have used the ToD super fast forward, you have a guaranteed 4x30% chance to drop a random item in any random room
*/

var _roomName = argument0;
var _todChangeFlag = argument1;

var _roomTrinketList = global.trinketSpawns[? _roomName];

var _spotRoll;
var _typeRoll;
var _roomRoll;

// Note: Actually this method was garbage, Idk what I was thinking. Probably the lack of sleep talking here.
// Reroll for another spot if this spot already has a trinket in it. Return if all spots are full in this list.
//var _numRolls = 1;
//while(_roomTrinketList[| _spotRoll] != -1) {
//	_spotRoll = irandom_range(0, global.numTrinketSpawns - 1);
//	++_numRolls;
//	if(_numRolls > 8) {
//		return;
//	}
//}

// Code for regular FF filling rules
if(!_todChangeFlag) {
	ds_list_replace(_roomTrinketList, _spotRoll, _typeRoll);
	
	// 1.  Place a trinket in a random room, in a random spot, with a random value
	// 1.a If place already has a trinket, skip
	
	// 2.  Roll chance for room's special trinket
	// 2a. If hit, find a random open slot and fill it with the special item
	
	
}
// Code for SuperFF filling rules
else {
	// 1.  Place a trinket in a random room other than the one you're in, in a random spot, with a random value
	// 1.a If place already has a trinket, skip
	// 1.b Roll until you fail on a thirty percent chance and place one in random room other than the one you're in
	
	// Rerolls
	_spotRoll = irandom_range(0, global.numTrinketSpawners - 1);
	_typeRoll = irandom_range(trinket.tr_1, trinket.tr_6);
	_roomRoll = irandom_range(0, array_length_1d(global.roomNames) - 1);
		
	// Roll until you get a room that isn't the one you're in
	while(global.roomNames[_roomRoll] == _roomName) { _roomRoll = irandom_range(0, array_length_1d(global.roomNames) - 1); }
		
	// Grab the trinketList for the random room (that just so happens to not be the one the player is in)
	var _randRoomTrinketList = global.trinketSpawns[? global.roomNames[_roomRoll]];
		
	// Check to see if there's already a trinket there
	if(_randRoomTrinketList[| _spotRoll] == -1) {
		// Replace the trinket with a randomly rolled trinket
		ds_list_replace(_randRoomTrinketList, _spotRoll, _typeRoll);
	}
	
	// Perform this code until we fail
	var _chanceRoll = irandom_range(0, 100);
	while(_chanceRoll < 15) {
		// This code is copy and pasted from the above repeat statement
		_spotRoll = irandom_range(0, global.numTrinketSpawners - 1);
		_typeRoll = irandom_range(trinket.tr_1, trinket.tr_6);
		while(global.roomNames[_roomRoll] == _roomName) { _roomRoll = irandom_range(0, array_length_1d(global.roomNames) - 1); }
		var _randRoomTrinketList = global.trinketSpawns[? global.roomNames[_roomRoll]];
		
		// Here is the one difference than up above.
		// I'd actually like to overwrite whatever was in this spot, just to throw some chaos into the mix.
		// It kind of simulates if you went to look for something that you saw earlier, but someone else took it so you missed it.
		ds_list_replace(_randRoomTrinketList, _spotRoll, _typeRoll);
		
		// Reroll the chance
		_chanceRoll = irandom_range(0, 100);
	}
}

//show_debug_message("The current room's trinket list: " + ds_list_write(trinketSpawns[? _roomName]));

//if(!_todChangeFlag) {
//	var _randomItemType = irandom_range(trinket.tr_1, trinket.tr_6);
//	var _extraItemRoll = irandom_range(0, 100);

//	if(_initialRoll < 50) {
//		// add a random trinket to a random room of a random type
	
//		// check to see if we spawn an extra item in the room you're in
//		if(_extraItemRoll <= 10) {
//			//trinketSpawns[, ]
//			//ds_map_add()
//		}
//	}
//}
//else {
	
//}